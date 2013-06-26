require 'httparty'

# Low level client for talking to the Geezeo API. This is where we handle the
# protocal (HTTP) related issues for talking to a Geezeo server.
class GeezeoClient
  include HTTParty
  base_uri    'https://beta-geezeosandbox.geezeo.com'
  basic_auth  '404a08ddaa52713f6c30c52f8afc5e3bb00536bd3aa7ace8fec20a7917bbef17f63bdb4c8f8e1953c3d34effdbe10a35070f99aa58c81db57d61a679808a0773', nil
  ssl_version :SSLv3
  ssl_ca_file ENV["SSL_CERT_FILE"]

  attr_reader :cache
  private     :cache

  def initialize(args={})
    @cache = args.fetch(:cache, Rails.cache)
  end

  def accounts(user_id)
    get_request "/api/v1/users/#{user_id}/accounts"
  end

  def account(user_id, account)
    get_request "/api/v1/users/#{user_id}/accounts/#{account}"
  end

  def transactions(user_id, account_id, page=1)
    get_request "/api/v1/users/#{user_id}/accounts/#{account_id}/transactions?page=#{page}"
  end

  def user(user_id)
    get_request "/api/v1/users/#{user_id}"
  end

  private

  def get_request(url)
    response = self.class.get url, {
      headers: {
        "If-None-Match" => lookup_etag(url)
      }
    }
    process_response(response, url)
  end

  # Handling just the most likely responses.
  def process_response(response, url)
    case response.code
    when 200...300
      cache_and_return response, url
    when 304
      lookup_content url
    when 400...500
      raise NotFoundError.new(response.response.message)
    else
      raise UnexpectedError.new(response.response.message)
    end
  end

  def cache_and_return(response, url)
    etag = response.headers["etag"]
    results = response.parsed_response

    if etag
      cache.write([url, "etag"], etag)
      cache.write([url, "content"], results)
    end

    results
  end

  def lookup_content(url)
    cache.read([url, "content"])
  end

  def lookup_etag(url)
    cache.read([url, "etag"]) || ""
  end

  class NotFoundError < StandardError; end
  class UnexpectedError < StandardError; end

end

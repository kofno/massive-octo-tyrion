class Transaction
  include ActiveModel::Model

  class << self
    def find(user_id, account_id, page=1)
      results = client.transactions(user_id, account_id, page)
      transactions = results["transactions"].map { |t| new t["transaction"] }
      make_paginated transactions, results["pages"]
    end

    private

    def client
      client ||= GeezeoClient.new
    end

    def make_paginated(target, pages)
      target.extend(Pagination)
      target.page = pages["current_page"]
      target.total_pages = pages["total_pages"]
      target
    end
  end

  attr_accessor :id,
                :reference_id,
                :transaction_type,
                :memo,
                :balance,
                :posted_at,
                :created_at,
                :nickname,
                :original_name,
                :check_number,
                :tags
end

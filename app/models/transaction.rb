class Transaction
  include ActiveModel::Model

  class << self
    def find(user_id, account_id)
      client.transactions(user_id, account_id)["transactions"].map { |t|
        new t["transaction"]
      }
    end

    private

    def client
      client ||= GeezeoClient.new
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

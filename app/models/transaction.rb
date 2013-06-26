class Transaction
  include ActiveModel::Model
  extend GeezeoSupport

  def self.find(user_id, account_id, page=1)
    results = client.transactions(user_id, account_id, page)
    transactions = results["transactions"].map { |t| new t["transaction"] }
    make_paginated transactions, results["pages"]
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

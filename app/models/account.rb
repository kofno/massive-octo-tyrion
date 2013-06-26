class Account
  include ActiveModel::Model
  extend GeezeoSupport

  def self.find(user_id)
    client.accounts(user_id)["accounts"].map { |a| new(a) }
  end

  def self.find_by_user_and_account(user, account)
    new client.account(user, account)
  end

  attr_accessor :id,
                :name,
                :balance,
                :reference_id,
                :aggregation_type,
                :state,
                :harvest_updated_at,
                :account_type,
                :fi

end

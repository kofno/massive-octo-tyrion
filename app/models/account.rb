class Account
  include ActiveModel::Model

  class << self
    def find(user_id)
      client.accounts(user_id)["accounts"].map { |a| new(a) }
    end

    def find_by_user_and_account(user, account)
      new client.account(user, account)
    end

    private

    def client
      @client ||= GeezeoClient.new
    end
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

class Account
  include ActiveModel::Model

  class << self
    def find(user_id)
      client.accounts(user_id)["accounts"].map { |a| new(a) }
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

class User
  include ActiveModel::Model

  class << self
    def find(user_id)
      new client.user(user_id)
    end

    def client
      @client ||= GeezeoClient.new
    end
  end

  attr_accessor :id,
                :partner_customer_id,
                :first_name,
                :last_name

  def name
    "#{first_name} #{last_name}"
  end
end

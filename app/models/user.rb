class User
  include ActiveModel::Model
  extend GeezeoSupport

  def self.find(user_id)
    new client.user(user_id)
  end

  attr_accessor :id,
                :partner_customer_id,
                :first_name,
                :last_name

  def name
    "#{first_name} #{last_name}"
  end
end

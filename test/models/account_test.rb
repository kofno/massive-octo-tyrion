require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = Account.new
  end

end

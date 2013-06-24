require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = Transaction.new
  end

end

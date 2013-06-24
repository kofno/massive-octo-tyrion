require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = User.new first_name: 'Sample', last_name: 'User'
  end

  test "Name concatenation" do
    assert_equal 'Sample User', @model.name
  end
end

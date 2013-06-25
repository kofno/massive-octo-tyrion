require 'test_helper'

class ViewAccountsTest < ActionDispatch::IntegrationTest

  test "Viewing accounts" do
    get "/ryanbell/accounts"

    assert_response :success
    assert assigns[:user]
    assert assigns[:accounts]

    assert_select 'dt a', 'eChecking'
    assert_select 'dt a', 'Complete Savings'
    assert_select 'dt a', 'Preferred Plus Card'
  end

  test "accounts load failure" do
    get "/someone/accounts"
    assert_response :not_found
  end
end

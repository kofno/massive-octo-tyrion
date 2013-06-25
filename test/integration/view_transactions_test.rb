require 'test_helper'

class ViewTransactionsTest < ActionDispatch::IntegrationTest

  test "Viewing transactions" do
    get "/ryanbell/accounts/4372067"

    assert_response :success
    assert assigns[:transactions]

    assert_select 'dt', 'GameStop Entertainment June 9, 2013'
    assert_select 'dd', '-50.99'
  end

  test "Loading transactions fail" do
    get "/ryanbell/accounts/foo"
    assert_response :not_found
  end
end

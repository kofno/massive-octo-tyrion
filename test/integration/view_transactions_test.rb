require 'test_helper'

class ViewTransactionsTest < ActionDispatch::IntegrationTest

  test "Viewing transactions" do
    get "/ryanbell/accounts/4372067"

    assert_response :success
    assert assigns[:transactions]

    assert_select '.memo', /^GameStop/
    assert_select '.balance.debit', '$59.99'
  end

  test "Loading transactions fail" do
    get "/ryanbell/accounts/foo"
    assert_response :not_found
  end
end

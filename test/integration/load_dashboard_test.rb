require 'test_helper'

class LoadDashboardTest < ActionDispatch::IntegrationTest

  test "Loading a the dashboard" do
    get "/dashboard/ryanbell"

    assert_response :success
    assert assigns(:user), "Failed to assign user"

    assert_select 'h1', "Sample User"
    assert_select 'h2', "eChecking      $300.54"
  end

  test "Failing dashboard loads" do
    get "/dashboard/not-a-user"
    assert_response :not_found
  end
end

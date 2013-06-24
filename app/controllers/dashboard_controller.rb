class DashboardController < ApplicationController
  respond_to :html

  def view
    @user = User.find(params[:user_id])
    @accounts = Account.find(params[:user_id])
    fresh_when [@user, @accounts]
  end

end
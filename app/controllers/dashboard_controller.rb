class DashboardController < ApplicationController
  respond_to :html

  def view
    @user = User.find(params[:user_id])
  end

end

class AccountsController < ApplicationController
  helper_method :user_id, :account_id

  def index
    @user = User.find(user_id)
    @accounts = Account.find(user_id)
    fresh_when etag: [@user, @accounts]
  end

  def show
    @transactions = Transaction.find(user_id, account_id, page)
    fresh_when etag: @transactions
  end

  private

  def user_id
    params[:user_id]
  end

  def account_id
    params[:id]
  end

  def page
    params[:page] || 1
  end
end

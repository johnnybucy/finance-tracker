class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end
  def new_user_stock
  end
end

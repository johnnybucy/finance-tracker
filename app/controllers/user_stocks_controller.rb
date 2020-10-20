class UserStocksController < ApplicationController
    def create
        tick = params[:ticker]
        tick = tick.downcase
        stock = Stock.check_db(tick)
        if stock.blank?
            stock = Stock.new_lookup(tick)
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
        redirect_to my_portfolio_path
    end 
  
    def destroy
        stock = Stock.find(params[:id])
        user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
        user_stock.destroy
        #flash[:alert] "Hey, #{stock.ticker} was successfully removed from portfolio"
        redirect_to my_portfolio_path
    end
    def new
    end
end

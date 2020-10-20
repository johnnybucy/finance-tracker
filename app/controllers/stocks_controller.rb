class StocksController < ApplicationController
  def search
    if params[:stock].present?
     @stock= Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/results' }
        end
      else
        respond_to do |format|
        flash[:notice] = "please enter a valid symbol to search"
        format.js { render partial: 'users/results' }
        end
      end
    else
      respond_to do |format|
        flash[:notice] = "no symbol."
        format.js { render partial: 'users/results' }
      end
    end
  end
  
  def new
    @stock = Stock.new
  end
  
  def create
    @stock = Stock.new
    puts "TICKER =" + params[:stock][:ticker]
    @stock.name =  params[:stock][:name]
    @stock.ticker =  params[:stock][:ticker]
    @stock.last_price =  params[:stock][:latest_price]
    @stock.category =  params[:stock][:category]
    @stock.save
      redirect_to my_portfolio_path 
  end
end

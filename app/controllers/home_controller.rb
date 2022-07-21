class HomeController < ApplicationController
  def index
    if params[:ticker] == ""
        @nothing = "Please enter a stock symbol!"
    elsif params[:ticker]
      StockQuote::Stock.new(api_key: "pk_9fa34831d0db4a2982e4f5eb49694fc1")
      begin
        @stock = StockQuote::Stock.quote(params[:ticker])
        rescue RuntimeError
      end
      if !@stock
        @error = "Hey! That stock symbol does not exist."
      end
    end
  end

  def about
  end
end

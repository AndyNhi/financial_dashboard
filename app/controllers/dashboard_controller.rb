class DashboardController < ApplicationController

  def index
    @portfolio_tweet_string = ""
    current_user.quotes.each do |hash|
      @portfolio_tweet_string += " OR $#{hash.ticker}"
    end
    @portfolio_tweet_string
  end

end


class DashboardController < ApplicationController

include YahooHelper

  def index

    if current_user.present?
      @portfolio_tweet_string = hash_string
      @portfolio_status = portfolio_tracking
    end



  end

private

  def hash_string
    hash_tickers = ""
    current_user.quotes.each { |hash| hash_tickers += " OR $#{hash.ticker}" }
    hash_tickers
  end

end

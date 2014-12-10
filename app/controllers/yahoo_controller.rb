require 'yahoo_finance'

class YahooController < AppliciationController

  before_action :fetch_user_quotes

  def user_quotes_price
    YahooFinance.quotes(@user_quotes, [:last_trade_price])
  end

  private

  def fetch_user_quotes
    @user_quotes = Quote.where(user_id: current_user.id).pluck(:ticker)
  end


end

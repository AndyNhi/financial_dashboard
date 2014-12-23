
class DashboardController < ApplicationController

  def index
    @portfolio_quotes = YahooApi.new.portfolio(user_quotes) if current_user.present?
    @portfolio_tweets = TwitterApi.new.tweet(user_symbols) if current_user.present?
    @daily_tweets = StockTwitApi.new.trending_tickers if current_user.present?
    @symbol = params[:symbol]
  end

  def update_yahoo_quotes
    @portfolio_quotes = YahooApi.new.portfolio(user_quotes) if current_user.present?
    render partial: 'yahoo_quotes', locals: {quote: @portfolio_quotes}
  end



  def update_tweets
    @portfolio_tweets = TwitterApi.new.tweet(user_symbols) if current_user.present?
    render partial: 'portfolio_tweets', locals: {tweets: @portfolio_tweets}
  end

  def update_stock_twits
    @daily_tweets = StockTwitApi.new.trending_tickers
    render partial: 'stock_twits', locals: {twit: @daily_tweets}
  end

private

  def user_quotes
    Quote.where(user_id: current_user.id).pluck(:ticker)
  end

  def user_symbols
    hash_tickers = ""
    current_user.quotes.each { |hash| hash_tickers += " OR $#{hash.ticker}" }
    hash_tickers
  end

end

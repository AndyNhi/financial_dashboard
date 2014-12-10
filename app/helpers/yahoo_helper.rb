module YahooHelper

def portfolio_tracking
  YahooFinance.quotes([Quote.where(user_id: current_user.id).pluck(:ticker)],
      [
        :name,
        :last_trade_realtime_withtime,
        :change_and_percent_change,
        :symbol,
      ]
    )
end



end

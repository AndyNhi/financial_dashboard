class YahooApi

  def portfolio(symbols)
    YahooFinance.quotes([symbols],
      [
        :name,
        :last_trade_realtime_withtime,
        :change_and_percent_change,
        :symbol,
        :average_daily_volume,
        :eps_estimate_current_year,
        :eps_estimate_next_quarter,
        :eps_estimate_next_year,
      ]
    )
  end




end

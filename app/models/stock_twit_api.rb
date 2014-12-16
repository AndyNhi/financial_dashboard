class StockTwitApi

  def initialize
    @connection = Faraday.new(url: 'https://api.stocktwits.com')
  end

  def trending_tickers
    response = @connection.get do |req|
      req.url "/api/2/streams/trending.json"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end

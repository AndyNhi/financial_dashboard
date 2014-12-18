class TwitterApi

  def tweet(symbols)
    TWITTERAPI.search(symbols, :result_type => "recent").take(30)
  end

end

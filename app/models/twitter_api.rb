class TwitterApi

  def tweet(symbols)
    TWITTERAPI.search(symbols, :result_type => "recent").take(40)
  end

end

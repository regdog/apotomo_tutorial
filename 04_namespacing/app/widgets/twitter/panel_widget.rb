class Twitter::PanelWidget < Apotomo::Widget
  responds_to_event :submit, :with => :process_tweet
  
  def display
    @tweets = Tweet.all
    render
  end
  
  def process_tweet(evt)
    @tweet = Tweet.new
    @tweet.update_attributes(evt[:text])
    replace :state => :display
  end
  
  def list(tweets)
    render :locals => {:tweets => tweets}
  end
  
  def form
    @tweet = Tweet.new
    render
  end
  
  def error_messages
    render
  end
  
end

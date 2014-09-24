class UsersController < ApplicationController
  def sign_in
  end

  def oauth_callback
  	session[:access_token] = request.env['omniauth.auth']['credentials']['token']
  	session[:access_secret] = request.env['omniauth.auth']['credentials']['secret']
  	respond_to do |format|
  		format.html {redirect_to "/home"}
    end
  end

  def home
    @client = Twitter::REST::Client.new do |config|
        config.consumer_key = "HLEWQ9YhTkM3Pw3TOfmlg"
        config.consumer_secret = "9ovaaaWa8OoFKt22dkMYUusMx53rgMzi3B5qEwTTs"
        config.access_token = session['access_token']
        config.access_token_secret = session['access_secret']
    end
  end

  def followers
    home()
    @followers = @client.followers.to_a
  end

  def following
    home()
    user = User.find_by_user_id(@client.user.id)
    @following = @client.friends.to_a
    # @whitelisted_users = []
    # for whitelist in user.whitelists
    #   @whitelisted_users.push(whitelist.whitelist_user_id)
    # end
    # puts @whitelisted_users
  end
    
  def nonfollowers
  	@nonfollowers = []
    following()
    followers()
    #debugger
      for following_user in @following
        if !(@followers.include? following_user) 
          @nonfollowers.push(following_user)
        end
      end
  end

  def fans
    @fans = []
    following()
    followers()
    for follower_user in @followers
      if !(@following.include? follower_user) 
        @fans.push(follower_user)
      end
    end
  end

  def inactive_following
    home()
    @inactive_following = []
    for friend in @client.friends
      # puts friend.inspect.to_s
      tweets = @client.user_timeline(friend.id)
      # for tweet in tweets
      #   puts tweet.created_at
      # end
      if tweets.length > 0 
        last_tweet_at = tweets.first.created_at
        if last_tweet_at < 30.days.ago
          @inactive_following.push(friend)
        end
      else
        @inactive_following.push(friend)
      end
    end 
  end

  # def whitelist
  #   @whitelisted_user = Whitelist.new
  # end

  # def whitelist_user
  #   home()
  #   user = User.find_by_user_id(@client.user.id)
  #   @whitelisted_user = Whitelist.new
  #   @whitelisted_user.user_id = user.id
  #   @whitelisted_user.whitelist_user_id = params[:whitelist_user_id]
  #   @whitelisted_user.save
  #   redirect_to "/users/following" 
  # end

  def sign_out
    session[:access_token] = nil
    session[:access_secret] = nil
    redirect_to action: "sign_in"
  end
end


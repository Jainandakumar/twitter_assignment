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
    @followers = @client.followers.to_a
  end

  def following
    @following = @client.friends.to_a
  end
    
  def nonfollowers
  	@nonfollowers = []
    #debugger
      for following_user in @following
        if !(@followers.include? following_user) 
          @nonfollowers.push(following_user)
        end
      end
  end

  def fans
    @fans = []
    for follower_user in @followers
      if !(@following.include? follower_user) 
        @fans.push(follower_user)
      end
    end
  end

  # def whitelist
  #   @whitelist = []
    
  # end

  # def inactive_following
  #   @inactive_following = []
  #   for following_user in @following
  #     if follower_user.tweets
  # end

  def sign_out
    session[:access_token] = nil
    session[:access_secret] = nil
    redirect_to action: "sign_in"
  end


end


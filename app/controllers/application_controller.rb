class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def twitter
    Twitter::REST::Client.new do |config|
        config.consumer_key = "HLEWQ9YhTkM3Pw3TOfmlg"
        config.consumer_secret = "9ovaaaWa8OoFKt22dkMYUusMx53rgMzi3B5qEwTTs"
        config.oauth_token = session['access_token']
        config.oauth_token_secret = session['access_secret']
    end
  end

 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

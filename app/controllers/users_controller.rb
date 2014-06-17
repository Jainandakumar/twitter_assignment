class UsersController < ApplicationController
  def sign_in
  end

  def oauth_callback
  	session[:access_token] = request.env['omniauth.auth']['credentials']['token']
  	session[:access_secret] = request.env['omniauth.auth']['credentials']['secret']

    user_info = twitter.current_user
  	user = User.find_by_user_id(user_info.id)

  	if user.nil?
  		user = User.new(user_id: user_info.id, screen_name: user_info.screen_name)
  		user.save
  	else
  		user.update_attributes(oauth_token: session[:access_token], oauth_secret: session[:access_secret])
  	end

  	session[:user_id] = user.id
    session[:screen_name] = user.screen_name
  	respond_to do |format|
  		format.html {redirect_to "/home"}
  	end

  def home
  	@user = current_user
  end

  end
end

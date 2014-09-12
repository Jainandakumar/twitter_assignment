class User < ActiveRecord::Base

	has_many :whitelists

	def update_picture(omniauth)
    self.picture   = omniauth['info']['image'] 
  end

end

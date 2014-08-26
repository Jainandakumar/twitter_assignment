class User < ActiveRecord::Base

	def update_picture(omniauth)
    self.picture   = omniauth['info']['image'] 
  end

end

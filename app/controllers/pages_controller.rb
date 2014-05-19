class PagesController < ApplicationController
	def home
		if @users
			@users = User.where(id: current_user.id)
		end
	end

	def account
		
	end

end

class PagesController < ApplicationController
	def home
		if @users
			@users = User.where(id: current_user.id)
		end
		render :layout => 'home'
	end

	def account
		 render :layout => 'account'
		
	end

end

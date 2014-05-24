class PagesController < ApplicationController
<<<<<<< HEAD

	before_filter :authenticate_user!, :except => [:home]


=======
	before_filter :authenticate_user!, :except => [:home]
>>>>>>> 32e724814e6a98e5a78da489c0059d4bc231543c
	
	def home
		if @users
			@users = User.where(id: current_user.id)
		end
	end

	def account
		 # render :layout => 'account'
		
	end

	def search
		@societies = Society.search(params[:search_input])
		@events = Event.search(params[:search_input])

		# @societies = Society.where('name = ?', params[:search_input])
		# @events = Event.where('name = ?', params[:search_input])
		render 'search'
	end
end

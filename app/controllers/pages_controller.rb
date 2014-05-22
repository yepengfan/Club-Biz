class PagesController < ApplicationController
	def home
		if @users
			@users = User.where(id: current_user.id)
		end
	end

	def account
		
	end

	def search
		@societies = Society.search(params[:search_input])
		@events = Event.search(params[:search_input])

		# @societies = Society.where('name = ?', params[:search_input])
		# @events = Event.where('name = ?', params[:search_input])
		render 'search'
	end
end

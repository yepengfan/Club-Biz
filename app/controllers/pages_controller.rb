class PagesController < ApplicationController
	before_filter :authenticate_user!, :except => [:home]
	before_filter :authenticate_admin!, :except => [:home]
	
	def home
		if @users
			@users = User.where(id: current_user.id)
		end
	end

	def account
		
	end

	def show_registrations
		@societies = Society.all
	end

	def search
		@societies = Society.search(params[:search_input])
		@events = Event.search(params[:search_input])

		# @societies = Society.where('name = ?', params[:search_input])
		# @events = Event.where('name = ?', params[:search_input])
		render 'search'
	end
end

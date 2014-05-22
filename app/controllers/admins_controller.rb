class AdminsController < ApplicationController
	before_filter :authenticate_admin!

	def show_registrations
		@societies = Society.all
	end
end

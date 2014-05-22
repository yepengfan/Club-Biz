class SocietiesController < ApplicationController
	def index
		render 'index'
	end

	def show
		@society = Society.find(params[:id])
		render 'show'
	end

	def new
		@society = Society.new
	end

	def confirm
		# puts "!!!!!!!!!!!!!!!!!!!!!!!"
		# puts params[:id]
		# puts params[:state]
		@society = Society.find(params[:id])
		@society.state = params[:state]
		@society.save
		
		redirect_to show_registrations_path
	end

	def create
		# @society = Society.new(society_params)
		# @society.save
		@society = Society.new
		@society.upload(society_params)
		index
	end

	private
	def society_params
		params.require(:society).permit!
	end
end

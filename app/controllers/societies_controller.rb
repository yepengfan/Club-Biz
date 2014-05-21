class SocietiesController < ApplicationController
	def index
		render 'index'
	end

	def show
		render 'show'
	end

	def new
		@society = Society.new
	end

	def create
		@society = Society.new(society_params)
		@society.save
		index
	end

	private
	def society_params
		params.require(:society).permit!
	end
end

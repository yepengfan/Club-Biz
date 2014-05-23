class EventsController < ApplicationController
	def index

	end

	def new
		@event = Event.new
	end 

	def show
		@event = Event.new
		render 'show'
	end

	def create
		@event = Event.new(event_params)
		puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
		puts @event.inspect()
		@event.save
		show
	end

	def my_events
		
	end

	private
	def event_params
		params.require(:event).permit!
	end
end

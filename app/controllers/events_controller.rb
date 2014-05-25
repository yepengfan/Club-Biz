class EventsController < ApplicationController

	def index

	end

	def new
		@event = Event.new
		puts params[:society_id]
	end 

	def show
		@event = Event.find(params[:id])
		@comment = Comment.new
		@comments = Comment.where("event_id = ?", params[:id])
		render 'show'
	end
	def reserve_event
		@event = Event.find(params[:id])
		@comment = Comment.new
		@comments = Comment.where("event_id = ?", params[:id])
		
	end

	def share_events
		@society = Society.new
	end

	def confirm_share
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		puts society_params[:name]
		society = Society.where("name = ?", society_params[:name]).first
		@activity = Activity.new
		if society
			@activity.share_upload(society.id, params[:id])
		end
		show
	end

	def my_events
		@result = []
		events = Reservation.where("user_id = ?", current_user.id)

		events.each do |f|
			event = Event.find(f.event_id)
			@result.push(event)
		end
	end


	def add_comments
		@comment = Comment.new
		@comment.upload(params[:id], current_user.id, comment_params[:content])
		show
	end

	def reserve_tickets
		@reservation = Reservation.new
		puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		puts current_user.id
		puts params[:id]
		@reservation.upload(params[:id], current_user.id, params[:amount])
		redirect_to my_events_path
	end

	private
	def event_params
		params.require(:event).permit!
	end

	private
	def comment_params
		params.require(:comment).permit!
	end

	private
	def society_params
		params.require(:society).permit!
	end
end

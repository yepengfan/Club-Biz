class SocietiesController < ApplicationController
	def index
		render 'index'
	end

	def show
		@society = Society.find(params[:id])
	end

	def list_events()
		@results = []
		activities = Activity.where("society_id = ?", params[:id] )
		activities.each do |f|
			event = Event.find(f.event_id)
			@results.push(event)
		end
	end

	def new
		@society = Society.new
	end

	def edit
		@society = Society.find(params[:id])
	end

	def confirm_edit
		puts society_params[:desc]
		puts params[:id]
		@society = Society.find(params[:id])
		puts @society.name
		@society.update(society_params)
		puts "!!!!!!!!!!!!!!"
		puts @society.desc

		render 'edit'
	end

	def confirm
		@society = Society.find(params[:id])
		@society.state = params[:state]
		@membership = Membership.where("society_id = ? AND auth = ?", params[:id], 2 ).first
		

		user_id = @membership.user_id
		@user = User.find(user_id)

		if params[:state] == "1"
			UserMailer.confirm_society_email(@user).deliver
		elsif params[:state] == "2"
			UserMailer.deny_society_email(@user).deliver
		end
		@society.save
		
		redirect_to show_registrations_path
	end

	def create
		# @society = Society.new(society_params)
		# @society.save

		# puts current_user.id
		@society = Society.new
		@society.upload(society_params)

		@user = User.find(current_user.id)
		@user.admin = true
		@user.save

		@memberships = Membership.new
		@memberships.admin_update(@society.id, current_user.id)

		redirect_to my_account_path
	end

	def update_bearers
		@bearer = Bearer.new
	end

	def create_bearers
		@bearer = Bearer.new
		@bearer.update(bearer_params, params)
		# render 'index'
		@society = Society.new
		# render template: "societies/show"
		show_bearers
	end

	def show_bearers
		@society = Society.find(params[:id])
		# puts @society.id
		@bearers = Bearer.where(society_id: @society.id )
		render 'show_bearers'
	end

	def update_memberships
		@memberships = Membership.new
		@user = User.new
	end

	def confirm_memberships
		@user = User.new(user_params)
		@user.admin = true
		@user.save
		@memberships = Membership.new
		@memberships.add_user(params[:id], @user.id, params[:auth])
		render "update_memberships"
	end

	def my_societies
		@result = []
		societies = Membership.where(user_id: current_user.id)

		puts societies.first.society_id
		societies.each do |f|
			society = Society.find(f.society_id)
			puts "!!!!!!!!!"
			puts society.name
			@result.push(society)
		end
	end

	def update_events
		@event = Event.new
	end

	def confirm_events
		@event = Event.new
		@event.upload(event_params, params[:category])
		puts params[:id]
		@activity = Activity.new
		@activity.host_upload(params[:id], @event.id)

		render "update_events"
	end

	private
	def society_params
		params.require(:society).permit!
	end

	private
	def bearer_params
		params.require(:bearer).permit!
	end

	private
	def user_params
		params.require(:user).permit!
	end

	private
	def event_params
		params.require(:event).permit!
	end
end

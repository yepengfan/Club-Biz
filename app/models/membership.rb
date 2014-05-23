class Membership < ActiveRecord::Base
	belongs_to :society
	belongs_to :user

	def update(society_id, user_id)
		@memberships.society_id = society.id
		@memberships.user_id = user.id
		@memberships.save 
	end

end

class Membership < ActiveRecord::Base
	belongs_to :society
	belongs_to :user

	def update(society_id, user_id)
		self.society_id = society_id
		self.user_id = user_id
		self.auth = 0
		self.save 
	end

	def add_user(society_id, user_id, auth)
		self.society_id = society_id
		self.user_id = user_id
		self.auth = auth
		self.save
	end

	def admin_update(society_id, user_id)
		self.society_id = society_id
		self.user_id = user_id
		self.auth = 2
		self.save
	end

end

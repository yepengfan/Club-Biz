class Comment < ActiveRecord::Base
	belongs_to :event
	belongs_to :user

	def upload(event_id, user_id, content)
		self.event_id = event_id
		self.user_id = user_id
		self.content = content
		self.date = Time.now
		self.save
	end
end

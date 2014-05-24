class Reservation < ActiveRecord::Base
	belongs_to :event
	belongs_to :user

	# validates: :user_id, presence: true

	def upload(event_id, user_id, amount)
		self.event_id = event_id
		self.user_id = user_id
		self.amount = amount
		self.date = Time.now
		self.save
	end
end
	
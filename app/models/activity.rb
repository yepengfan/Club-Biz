class Activity < ActiveRecord::Base
	belongs_to :society	
	belongs_to :event

	def host_upload(society_id, event_id)
		self.society_id = society_id
		self.event_id = event_id
		self.host = true
		self.save
	end

	def share_upload(society_id, event_id)
		self.society_id = society_id
		self.event_id = event_id
		self.host = false
		self.save
	end
end

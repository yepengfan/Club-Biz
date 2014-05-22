class Event < ActiveRecord::Base
	has_many :activities
	has_many :societies, through: :activities
	has_many :comments
	has_many :reservations
	has_many :users, through: :reservations
	
	def self.search(keyword)
		result = []
		if keyword != ''
			events_list = Event.all
			events_list.each do |event|
				if event.name.include? keyword
					result.push(event)
				end
			end
			return result
		else
			result = Event.all
			return result
		end
	end

end
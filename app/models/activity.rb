class Activity < ActiveRecord::Base
	belongs_to :society	
	belongs_to :event
end

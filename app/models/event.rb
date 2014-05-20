class Event < ActiveRecord::Base
	belongs_to :category
	has_many :activities
	has_many :societies, through: :activities
	has_many :comments
	has_many :reservations
	has_many :users, through: :reservations
end

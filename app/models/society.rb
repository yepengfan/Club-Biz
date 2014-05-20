class Society < ActiveRecord::Base
	has_many :bearers, dependent: :destroy
	has_many :activities
	has_many :events, through: :activities, dependent: :destroy
	has_many :memberships
	has_many :users, through: :memberships
end

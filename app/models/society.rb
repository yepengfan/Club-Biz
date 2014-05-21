class Society < ActiveRecord::Base
	has_many :bearers, dependent: :destroy
	has_many :activities
	has_many :events, through: :activities, dependent: :destroy
	has_many :memberships
	has_many :users, through: :memberships

	has_attached_file :photo, :styles => { :small => "150x150>" },
	:url  => "/assets/events/:id/:style/:basename.:extension",
	:path => ":rails_root/public/assets/events/:id/:style/:basename.:extension"

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
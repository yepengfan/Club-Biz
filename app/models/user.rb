class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
  :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :reservations
  has_many :events, through: :reservations
  has_many :memberships
  has_many :societies, through: :memberships

  def full_name
  	"#{self[:first_name]} #{self[:last_name]}"
  end

  def new_user(useremail, userpassword, userfirst, userlast, userphone )
    self.new ({:email => useremail,
     :password => userpassword,
     :password_confirmation => userpassword,
     :first_name => userfirst,
     :last_name => userlast,
     :phone => userphone,
     :admin => "false" }).save(:validate => false)
  end
end

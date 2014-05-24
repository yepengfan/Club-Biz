class UserMailer < ActionMailer::Base
	default from: "club.biz.system@gmail.com"

	def confirm_society_email(user)
		@user = user
		mail to: @user.email, subject: 'Your society registration has confirmed!'
	end

	def deny_society_email(user)
		@user = user 
		mail to: @user.email, subject: 'Your society registration has denied!'
	end
end

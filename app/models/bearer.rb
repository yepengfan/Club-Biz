class Bearer < ActiveRecord::Base
	belongs_to :society
	def update(bearer_params, params)
		if bearer_params && params
			self.society_id = params[:id]
			self.first_name = bearer_params[:first_name]
			self.last_name = bearer_params[:last_name]
			self.phone = bearer_params[:phone]
			self.email = bearer_params[:email]
			self.save
		end
	end
end

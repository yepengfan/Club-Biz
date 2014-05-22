class Society < ActiveRecord::Base
	has_many :bearers, dependent: :destroy
	has_many :activities
	has_many :events, through: :activities, dependent: :destroy
	has_many :memberships
	has_many :users, through: :memberships

	def upload(society_params)
		self.name = society_params[:name]
		self.desc = society_params[:desc]
		self.regi_num = society_params[:regi_num]
		self.website = society_params[:website]
		self.p_first_name = society_params[:p_first_name]
		self.p_last_name = society_params[:p_last_name]
		self.p_phone = society_params[:p_phone]
		self.p_email = society_params[:p_email]
		self.state = 0
		self.announcement = ""

		if society_params[:photo_1]
			uploaded_io = society_params[:photo_1]
			File.open(Rails.root.join('app', 'assets', 'upload', society_params[:name] +'_'+ uploaded_io.original_filename), 'wb') do |file|
				file.write(uploaded_io.read)
			end

			self.photo_1 = society_params[:name] +'_'+uploaded_io.original_filename
		end

		if society_params[:photo_2]
			uploaded_io = society_params[:photo_2]
			File.open(Rails.root.join('app', 'assets', 'upload', society_params[:name] +'_'+ uploaded_io.original_filename), 'wb') do |file|
				file.write(uploaded_io.read)
			end
			self.photo_2 = society_params[:name] +'_'+uploaded_io.original_filename
		end

		if society_params[:photo_3]
			uploaded_io = society_params[:photo_3]
			File.open(Rails.root.join('app', 'assets', 'upload', society_params[:name] +'_'+ uploaded_io.original_filename), 'wb') do |file|
				file.write(uploaded_io.read)
			end
			self.photo_3 = society_params[:name] +'_'+uploaded_io.original_filename
		end

		self.save
	end


	def self.search(keyword)
		result = []
		if keyword != ''
			societies_list = Society.all
			societies_list.each do |society|
				if society.name.include? keyword
					result.push(society)
				end

			end
			return result
		else
			result = Society.all
			return result
		end
	end

end
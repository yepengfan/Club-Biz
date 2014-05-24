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

	def upload(event_params, category)
		self.name = event_params[:name]
		self.category = category
		self.start = event_params[:start]
		self.end = event_params[:end]
		self.total = event_params[:total]
		self.remain = event_params[:total]
		self.desc = event_params[:desc]

		if event_params[:photo_1]
			uploaded_io = event_params[:photo_1]
			File.open(Rails.root.join('app', 'assets', 'upload', event_params[:name] +'_'+ uploaded_io.original_filename), 'wb') do |file|
				file.write(uploaded_io.read)
			end

			self.photo_1 = event_params[:name] +'_'+uploaded_io.original_filename
		end

		if event_params[:photo_2]
			uploaded_io = event_params[:photo_2]
			File.open(Rails.root.join('app', 'assets', 'upload', event_params[:name] +'_'+ uploaded_io.original_filename), 'wb') do |file|
				file.write(uploaded_io.read)
			end
			self.photo_2 = event_params[:name] +'_'+uploaded_io.original_filename
		end

		if event_params[:photo_3]
			uploaded_io = event_params[:photo_3]
			File.open(Rails.root.join('app', 'assets', 'upload', event_params[:name] +'_'+ uploaded_io.original_filename), 'wb') do |file|
				file.write(uploaded_io.read)
			end
			self.photo_3 = event_params[:name] +'_'+uploaded_io.original_filename
		end
		self.save
	end
end
class AddColumnForEvents < ActiveRecord::Migration
	def up
		add_column :events, :photo_1, :string
		add_column :events, :photo_2, :string
		add_column :events, :photo_3, :string
	end
end

class AddColumnForSocieties < ActiveRecord::Migration
  def up
  	add_column :societies, :photo_1, :string
  	add_column :societies, :photo_2, :string
  	add_column :societies, :photo_3, :string
  end
end

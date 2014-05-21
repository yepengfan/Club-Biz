class AddColumnForAssets < ActiveRecord::Migration
  def up
  	add_column :assets, :society_id, :integer
  end
end

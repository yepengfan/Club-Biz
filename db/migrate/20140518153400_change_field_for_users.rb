class ChangeFieldForUsers < ActiveRecord::Migration
  def up
  	add_column :Users, :phone, :string
  	add_column :Users, :admin, :boolean
  end
end

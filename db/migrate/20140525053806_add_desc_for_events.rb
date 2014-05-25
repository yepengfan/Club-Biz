class AddDescForEvents < ActiveRecord::Migration
  def up
  	add_column :events, :desc, :string
  end
end

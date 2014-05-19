class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :society_id
      t.integer :user_id
      t.integer :auth

      t.timestamps
    end
  end
end

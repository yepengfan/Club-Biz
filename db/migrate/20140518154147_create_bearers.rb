class CreateBearers < ActiveRecord::Migration
  def change
    create_table :bearers do |t|
      t.integer :society_id
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end

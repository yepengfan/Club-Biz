class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :name
      t.string :desc
      t.string :regi_num
      t.string :website
      t.string :p_first_name
      t.string :p_last_name
      t.string :p_phone
      t.string :p_email
      t.integer :state
      t.text :announcement

      t.timestamps
    end
  end
end

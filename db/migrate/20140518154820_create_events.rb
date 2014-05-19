class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.datetime :start
      t.datetime :end
      t.integer :total
      t.integer :remain

      t.timestamps
    end
  end
end

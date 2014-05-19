class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :event_id
      t.integer :user_id
      t.datetime :date
      t.integer :amount

      t.timestamps
    end
  end
end

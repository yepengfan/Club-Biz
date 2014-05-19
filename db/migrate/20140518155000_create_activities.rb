class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :society_id
      t.integer :event_id
      t.boolean :host

      t.timestamps
    end
  end
end

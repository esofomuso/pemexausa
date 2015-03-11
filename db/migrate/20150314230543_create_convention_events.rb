class CreateConventionEvents < ActiveRecord::Migration
  def change
    create_table :convention_events do |t|
      t.string :name
      t.text :description
      t.datetime :event_time
      t.string :period
      t.string :location
      t.integer :year

      t.timestamps null: false
    end
  end
end

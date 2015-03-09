class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :event_date
      t.string :image

      t.timestamps null: false
    end
  end
end

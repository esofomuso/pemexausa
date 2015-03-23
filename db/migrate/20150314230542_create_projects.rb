class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :event_date
      t.string :image

      t.integer	:updated_by, null: false, default: 1
      t.timestamps null: false
    end
  end
end

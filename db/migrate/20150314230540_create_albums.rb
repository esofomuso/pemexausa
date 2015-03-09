class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.string :password
      t.integer :user_id
      t.datetime :event_date
      t.boolean :set_password
      t.integer :chapter_id

      t.timestamps null: false
    end
  end
end

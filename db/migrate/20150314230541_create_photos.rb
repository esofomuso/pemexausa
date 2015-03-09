class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :file_path
      t.string :image_size
      t.integer :album_id
      t.boolean :notify
      t.boolean :main_photo

      t.timestamps null: false
    end
  end
end

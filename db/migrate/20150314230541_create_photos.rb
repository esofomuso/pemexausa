class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :file_path
      t.string :image_size
      t.integer :album_id
      t.boolean :notify
      t.boolean :main_photo
      t.boolean :active, null: false, default: true

      t.integer	:updated_by, null: false, default: 1
      t.timestamps null: false
    end
  end
end

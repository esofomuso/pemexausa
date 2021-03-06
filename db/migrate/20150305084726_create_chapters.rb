class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :description
      t.integer :president_id
      t.string :headquarters
      t.boolean :active, default: true

      t.integer	:updated_by, null: false, default: 1
      t.timestamps null: false
    end
  end
end

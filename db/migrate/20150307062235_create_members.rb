class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.datetime :expires_at
      t.boolean :active
      t.integer :chapter_id

      t.timestamps null: false
    end
  end
end

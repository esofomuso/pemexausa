class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end

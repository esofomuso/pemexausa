class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.integer :user_id
      t.integer :city_id
      t.integer :state_id
      t.integer :zip_id
      t.string  :latitude
      t.string	:longitude
      t.boolean :active, default: true

      t.integer	:updated_by, null: false, default: 1
      t.timestamps null: false
    end
  end
end

class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.integer :code
      t.integer :state_id
			t.string  :latitude
			t.string	:longitude
			
      t.timestamps null: false
    end
  end
end

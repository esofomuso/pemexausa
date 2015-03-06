class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :purpose_id, null: false
      t.integer :fiscal_year
      t.integer :user_id, null: false
      t.integer :referer_id

      t.timestamps null: false
    end
  end
end

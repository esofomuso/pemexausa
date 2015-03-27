class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :username,					  null: false
      t.string :email,              null: false
      t.string :password
      t.string :encrypted_password
			t.string :first_name, null: false
			t.string :last_name_now, null: false
			t.string :last_name_pss
			t.string :middle_name
			t.integer :class_year
			t.integer :role_id
			t.integer :chapter_id
			t.string	:gender, null: false
			t.string	:phone
			t.text		:profession
			t.boolean :active, default: true
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      t.integer	:updated_by, null: false, default: 1
      t.timestamps null: false
    end

    add_index :users, :username,             unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end

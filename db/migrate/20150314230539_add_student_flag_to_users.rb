class AddStudentFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_time_student, :boolean, :null => false, :default => false
  end
end

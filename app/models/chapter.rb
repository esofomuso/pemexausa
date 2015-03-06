class Chapter < ActiveRecord::Base
	belongs_to :president, class_name: User
	has_many :users
end

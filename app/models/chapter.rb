class Chapter < ActiveRecord::Base
	belongs_to :president, class_name: User
	has_many :users
	has_many :members
	
	def self.active
		where( active: true )
	end
end

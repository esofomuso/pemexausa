class Role < ActiveRecord::Base
	has_many :users
	
	#{'regular' => 'Regular User', 'registered' => 'Registered User', 'paid' => 'Paid User', 'chapter_admin' => 'Chapter Admin', 'admin' => 'National Admin', 'super_admin' => 'Super Admin', 'developer' => 'Developer'}
	
	def self.super_admin
		where( name: 'super_admin').first
	end
	
	def self.admin
		where( name: 'admin').first
	end
	
	def self.chapter_admin
		where( name: 'chapter_admin').first
	end
	
	def self.developer
		where( name: 'developer').first
	end
	
	def self.registered_user
		where( name: 'registered').first
	end
	
	def self.paid_user
		where( name: 'paid').first
	end
	
	def self.regular_user
		where( name: 'regular').first
	end
end

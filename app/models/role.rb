class Role < ActiveRecord::Base
	has_many :users
	
	#['Super Admin', 'Admin', 'Registered User', 'Paid User', 'Guest']
	def self.super_admin
		where( name: 'Super Admin').first
	end
	
	def self.admin
		where( name: 'Admin').first
	end
	
	def self.registered_user
		where( name: 'Registered User').first
	end
	
	def self.paid_admin
		where( name: 'Paid User').first
	end
	
	def self.guest
		where( name: 'Guest').first
	end
end

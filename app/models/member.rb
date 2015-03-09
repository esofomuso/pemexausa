class Member < ActiveRecord::Base
	belongs_to :chapter
	belongs_to :user
	
	def expired
		self.expires_at < Date.today
	end
end

class Payment < ActiveRecord::Base
	belongs_to :purpose, class_name: PaymentPurpose
	belongs_to :user
	belongs_to :referer, class_name: User
end

class Photo < ActiveRecord::Base
	belongs_to	:updated_by, class_name: :user
	belongs_to :album
	# Photo uploader using carrierwave
	mount_uploader :image, PhotoUploader
end

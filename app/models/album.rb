class Album < ActiveRecord::Base
	belongs_to	:user
	belongs_to	:updated_by, class_name: :user
	# Album has many photos
	has_many    :photos, :inverse_of => :album, :dependent => :destroy
	# enable nested attributes for photos through album class
	accepts_nested_attributes_for :photos, allow_destroy: true
	
end

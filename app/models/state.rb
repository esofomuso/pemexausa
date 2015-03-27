class State < ActiveRecord::Base
	has_many :cities, dependent: :destroy
	has_many :zips, dependent: :destroy
	belongs_to :country
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :role
  belongs_to :chapter
  has_one :address
  has_one :ruling_chapter, class_name: Chapter, foreign_key: :president_id
  has_many :payments
end

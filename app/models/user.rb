class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :role
  belongs_to :chapter
  has_one :address
  has_one :member
  has_one :ruling_chapter, class_name: Chapter, foreign_key: :president_id
  has_many :payments
  
  validates :email, :username, :first_name, :last_name_now, :last_name_pss, :gender, presence: true
  
  
  def is_super_admin
  	self.role == Role.super_admin
  end
  
  def is_admin
  	self.role == Role.admin
  end
  
  def name
   "#{self.first_name} #{self.last_name_now}"
  end
end

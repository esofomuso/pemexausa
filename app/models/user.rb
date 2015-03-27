class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w( regular registered paid chapter_admin admin super_admin developer )
        
  belongs_to :role
  belongs_to :chapter
  belongs_to :updated_by, class_name: User, foreign_key: :updated_by
  has_one :address
  has_one :member
  has_one :ruling_chapter, class_name: Chapter, foreign_key: :president_id
  has_many :payments
  
  validates :email, :username, :first_name, :last_name_now, :last_name_pss, :gender, presence: true
  
  def super_admin?
  	self.role == Role.super_admin
  end
  
  def admin?
  	self.role == Role.admin
  end
  
  def registered?
  	self.role == Role.registered_user
  end
  
  # This method will check if current member is paid for this year.
  # That way we don't depend on role for this, and admins can be paid too.
  def paid?
  	true
  end
  
  def name
   "#{self.first_name} #{self.last_name_now}"
  end
  
  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end
	      
	def confirmation_required?
	  #update_attributes confirmed_at: Time.now unless self.encrypted_password.blank? || !self.confirmed_at.blank?
	  self.encrypted_password.blank?
	end
	
	def is?(r)
		self.role == r
	end
	
	def role_name
		self.role.name
	end


	# This method overrides that in the gem.
	# Attempt to find a user by its reset_password_token to reset its
	# password. If a user is found and token is still valid, reset its password and automatically
	# try saving the record. If not user is found, returns a new user
	# containing an error in reset_password_token attribute.
	# Attributes must contain reset_password_token, password and confirmation
	def self.reset_password_by_token(attributes={})
		reset_password_token       = attributes[:reset_password_token]
		recoverable = find_or_initialize_with_error_by(:reset_password_token, reset_password_token)

		if recoverable.persisted?
			if recoverable.reset_password_period_valid?
				recoverable.reset_password!(attributes[:password], attributes[:password_confirmation])
			else
				recoverable.errors.add(:reset_password_token, :expired)
			end
		end

		recoverable.reset_password_token = reset_password_token
		recoverable
	end
	
#	 Find a user by its confirmation token and try to confirm it.
#   If no user is found, returns a new user with an error.
#   If the user is already confirmed, create an error for the user
#   Options must have the confirmation_token
#  def self.confirm_by_token(confirmation_token)
#    confirmable = find_or_initialize_with_error_by(:confirmation_token, confirmation_token)
#    confirmable.confirm! if confirmable.persisted?
#    confirmable
#  end
end

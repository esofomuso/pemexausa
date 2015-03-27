class ProfileController < ApplicationController
	
	# @return [User]
	#   The user that is being created.
	expose(:user) { current_user || User.new }
	expose(:address) { user.address || Address.new }
	expose(:all_chapters) { Chapter.active }
	expose(:countries) { Country.all }
	expose(:payment_purposes) { PaymentPurpose.all }
	expose(:states) { State.all }
	
  def new
  	if current_user
  		render "show"
  	else
  		redirect_to "/users/sign_up"
  	end
  end
  
  def edit
  end 
  
  def change_password
  end 
  
  def show
  end
  
  # This action receives a form submission to update current_user.
  #
  # @request_param [Hash] password_info
  #   The current password, new password and new confirmation.
  #
  # OR
  #
  # @request_param [Hash] user
  #   The immediate attributes of the current_user.
  #
  # @renders index using ajax
  #   If there are errors, we see the original form.
  #   Otherwise the user details.
  def update    
    user = self.current_user

    password_info = params[:password_info] || {}
    if password_info.blank?
    	user.attributes = user_params
    	address.attributes = address_params if params[:user][:address]
    else
	    if password_info[:current].blank? || password_info[:new].blank? || password_info[:new_confirmation].blank?
	    	user.errors.add(:new_password, "can't be blank") if password_info[:new].blank?
	    	user.errors.add(:'New password (confirmation)', "can't be blank") if password_info[:new_confirmation].blank?
      end
      user.errors.add(:current_password, 'is invalid') unless user.valid_password?(password_info[:current])
      user.errors.add(:new_password, 'did not match the confirmation') unless password_info[:new] == password_info[:new_confirmation]
      user.password = password_info[:new]
      user.password_confirmation = password_info[:new_confirmation]
	  end
    if user.errors.blank? && user.save
    	address.save
    	sign_in(user, :bypass => true)
      flash[:success] = "Successfully Updated Your Profile Information."
    else 
    	render 'edit'
    end
    redirect_to '/profile'
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:user).require(:address).permit(:state_id, :city, :zip, :street1, :street2)
    end
    
    def user_params
      params.require(:user).permit(:role_id, :username, :email, :password, :password_confirmation, :first_name, :last_name_pss, :last_name_now, :gender, :full_time_student, :class_year, :profession, :middle_name)
    end
  
end

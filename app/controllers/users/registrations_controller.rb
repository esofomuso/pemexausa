class Users::RegistrationsController < Devise::RegistrationsController
	expose(:user) { resource || User.new }
	expose(:address) { user.address || Address.new }
	expose(:all_chapters) { Chapter.active }
	expose(:countries) { Country.all }
	expose(:states) { State.all }
	
 before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   def create
     super
     if resource.save
     		address.attributes = address_params
     		address.user_id = resource.id 
     		address.save
     end
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

   # You can put the params you want to permit in the empty array.
   def configure_sign_up_params
     devise_parameter_sanitizer.for(:sign_up) << [:chapter_id, :role_id, :username, :password, :password_confirmation, :email, :phone, :first_name, :last_name_pss, :last_name_now, :gender, :full_time_student, :class_year, :profession, :middle_name]
   end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

   # The path used after sign up.
#   def after_sign_up_path_for(resource)
#     super(resource)
#   end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:user).require(:address).permit(:country_id, :state_id, :city, :zip, :street1, :street2)
    end
    
  
end

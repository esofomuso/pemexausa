class Users::ConfirmationsController < Devise::ConfirmationsController
  
  def show
    if params[:confirmation_token].present?
      @original_token = params[:confirmation_token]
    elsif params[resource_name].try(:[], :confirmation_token).present?
      @original_token = params[resource_name][:confirmation_token]
    end
		conf_token = Devise.token_generator.digest(self, :confirmation_token, @original_token)
    self.resource = resource_class.find_by_confirmation_token conf_token
    if resource.nil? or resource.confirmed?
    	super 
		elsif resource && !resource.encrypted_password.blank?
			p = {"#{resource_name}".to_sym => {confirmation_token: conf_token}}
			redirect_to "/confirm?#{p.to_param}"
    end
  end
  
  def confirm
    @original_token = params[resource_name].try(:[], :confirmation_token)
    Rails.logger.debug{ ">>>>>>>>>>>>>>>> inside confirm @original_token = #{@original_token.inspect}, resource_name = #{resource_name}"}
    self.resource = resource_class.find_by_confirmation_token! @original_token
    
    resource.assign_attributes(params[resource_name].permit(:password, :password_confirmation)) unless (resource && !resource.encrypted_password.blank?) || params[resource_name].blank?

    if (resource && !resource.encrypted_password.blank?) || (params[resource_name][:password] && resource.valid? && resource.password_match?)
      self.resource.confirm!
      resource_class.confirm_by_token @original_token
      set_flash_message :notice, :confirmed
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      render :action => 'show'
    end
  end
  

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  #protected
  

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end

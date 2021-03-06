class Admin::UsersController < Admin::BaseController
  expose(:user) { User.find_by_id(params[:id]) || User.new }
  expose(:address) { user.address || Address.new }
  expose(:users) { User.all }

  # POST /admin/users
  # POST /admin/users.json
  def create
    respond_to do |format|
    	address.attributes = address_params 
      user.attributes = user_params
      if user.save
        address.user_id = user.id 
        address.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render :index, status: :created }
      else
      	params[:user][:address] = address.attributes
        format.html { render :new }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if user.update_without_password(user_params)
      	address.update_attributes(address_params) 
      	user.address = Address.create(address_params) if user.address.blank?
        format.html { redirect_to admin_user_path(user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: user }
      else
        format.html { render :edit }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:user).require(:address).permit(:country_id, :state_id, :city, :zip, :street1, :street2)
    end
    
    def user_params
      params.require(:user).permit(:chapter_id, :role_id, :username, :email, :phone, :first_name, :last_name_pss, :last_name_now, :gender, :full_time_student, :class_year, :profession, :middle_name)
    end
end

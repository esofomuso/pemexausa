class Admin::StatesController < Admin::BaseController
  expose(:state) {State.find_by_id(params[:id]) || State.new}
  
  # POST /admin/states
  # POST /admin/states.json
  def create
    state.attributes = state_params

    respond_to do |format|
      if state.save
        format.html { redirect_to admin_states_path, notice: 'State was successfully created.' }
        format.json { render :show, status: :created, location: state }
      else
        format.html { render :new }
        format.json { render json: state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/states/1
  # PATCH/PUT /admin/states/1.json
  def update
    respond_to do |format|
      if state.update(state_params)
        format.html { redirect_to admin_state_path(state), notice: 'State was successfully updated.' }
        format.json { render :show, status: :ok, location: state }
      else
        format.html { render :edit }
        format.json { render json: state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/states/1
  # DELETE /admin/states/1.json
  def destroy
    state.destroy
    respond_to do |format|
      format.html { redirect_to states_url, notice: 'State was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params[:state]
    end
end

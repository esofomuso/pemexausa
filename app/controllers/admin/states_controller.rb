class Admin::StatesController < Admin::BaseController
  before_action :set_admin_state, only: [:show, :edit, :update, :destroy]

  # GET /admin/states
  # GET /admin/states.json
  def index
    states = State.all
  end

  # GET /admin/states/1
  # GET /admin/states/1.json
  def show
  end

  # GET /admin/states/new
  def new
    state = State.new
  end

  # GET /admin/states/1/edit
  def edit
  end

  # POST /admin/states
  # POST /admin/states.json
  def create
    state = State.new(admin_state_params)

    respond_to do |format|
      if state.save
        format.html { redirect_to state, notice: 'State was successfully created.' }
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
      if state.update(admin_state_params)
        format.html { redirect_to state, notice: 'State was successfully updated.' }
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
      format.html { redirect_to admin_states_url, notice: 'State was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_state
      state = State.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_state_params
      params[:admin_state]
    end
end

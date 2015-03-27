class Admin::ZipsController < Admin::BaseController
  before_action :set_admin_zip, only: [:show, :edit, :update, :destroy]

  # GET /admin/zips
  # GET /admin/zips.json
  def index
    zips = Zip.all
  end

  # GET /admin/zips/1
  # GET /admin/zips/1.json
  def show
  end

  # GET /admin/zips/new
  def new
    zip = Zip.new
  end

  # GET /admin/zips/1/edit
  def edit
  end

  # POST /admin/zips
  # POST /admin/zips.json
  def create
    zip = Zip.new(admin_zip_params)

    respond_to do |format|
      if zip.save
        format.html { redirect_to zip, notice: 'Zip was successfully created.' }
        format.json { render :show, status: :created, location: zip }
      else
        format.html { render :new }
        format.json { render json: zip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/zips/1
  # PATCH/PUT /admin/zips/1.json
  def update
    respond_to do |format|
      if zip.update(admin_zip_params)
        format.html { redirect_to zip, notice: 'Zip was successfully updated.' }
        format.json { render :show, status: :ok, location: zip }
      else
        format.html { render :edit }
        format.json { render json: zip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/zips/1
  # DELETE /admin/zips/1.json
  def destroy
    zip.destroy
    respond_to do |format|
      format.html { redirect_to admin_zips_url, notice: 'Zip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_zip
      zip = Zip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_zip_params
      params[:admin_zip]
    end
end

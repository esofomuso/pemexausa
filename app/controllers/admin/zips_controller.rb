class Admin::ZipsController < Admin::BaseController
  expose(:zip) { Zip.find_by_id(params[:id]) || Zip.new}
  

  # POST /admin/zips
  # POST /admin/zips.json
  def create
    zip.attributes = zip_params

    respond_to do |format|
      if zip.save
        format.html { redirect_to admin_zips_path, notice: 'Zip was successfully created.' }
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
      if zip.update(zip_params)
        format.html { redirect_to admin_zip_path(zip), notice: 'Zip was successfully updated.' }
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
    # Never trust parameters from the scary internet, only allow the white list through.
    def zip_params
      params[:zip]
    end
end

class Admin::PhotosController < Admin::BaseController
  expose(:photo) {Photo.find_by_id(params[:id]) || Photo.new}
  
  # POST /admin/photos
  # POST /admin/photos.json
  def create
    photo.attributes = photo_params

    respond_to do |format|
      if photo.save
        format.html { redirect_to admin_photos_path, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: photo }
      else
        format.html { render :new }
        format.json { render json: photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/photos/1
  # PATCH/PUT /admin/photos/1.json
  def update
    respond_to do |format|
      if photo.update(photo_params)
        format.html { redirect_to admin_photo_path(photo), notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: photo }
      else
        format.html { render :edit }
        format.json { render json: photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/photos/1
  # DELETE /admin/photos/1.json
  def destroy
    photo.destroy
    respond_to do |format|
      format.html { redirect_to admin_photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params[:photo]
    end
end

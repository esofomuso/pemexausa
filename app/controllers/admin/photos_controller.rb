class Admin::PhotosController < Admin::BaseController
  before_action :set_admin_photo, only: [:show, :edit, :update, :destroy]

  # GET /admin/photos
  # GET /admin/photos.json
  def index
    photos = Photo.all
  end

  # GET /admin/photos/1
  # GET /admin/photos/1.json
  def show
  end

  # GET /admin/photos/new
  def new
    photo = Photo.new
  end

  # GET /admin/photos/1/edit
  def edit
  end

  # POST /admin/photos
  # POST /admin/photos.json
  def create
    photo = Photo.new(admin_photo_params)

    respond_to do |format|
      if photo.save
        format.html { redirect_to photo, notice: 'Photo was successfully created.' }
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
      if photo.update(admin_photo_params)
        format.html { redirect_to photo, notice: 'Photo was successfully updated.' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_photo
      photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_photo_params
      params[:admin_photo]
    end
end

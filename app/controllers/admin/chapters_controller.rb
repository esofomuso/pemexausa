class Admin::ChaptersController < Admin::BaseController
  expose(:chapter) { Chapter.find(params[:id]) || Chapter.new }
	
  # POST /admin/chapters
  # POST /admin/chapters.json
  def create
    respond_to do |format|
      if chapter.save
        format.html { redirect_to chapter, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: chapter }
      else
        format.html { render :new }
        format.json { render json: chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/chapters/1
  # PATCH/PUT /admin/chapters/1.json
  def update
    respond_to do |format|
      if chapter.update(admin_chapter_params)
        format.html { redirect_to chapter, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: chapter }
      else
        format.html { render :edit }
        format.json { render json: chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/chapters/1
  # DELETE /admin/chapters/1.json
  def destroy
    chapter.destroy
    respond_to do |format|
      format.html { redirect_to admin_chapters_url, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_chapter_params
      params[:admin_chapter]
    end
end

class Admin::ProjectsController < Admin::BaseController
  expose(:projects) { Project.all }
  expose(:project) {Project.find_by_id(params[:id] || Project.new}
  

  # POST /admin/projects
  # POST /admin/projects.json
  def create
    project.attributes = admin_project_params

    respond_to do |format|
      if project.save
        format.html { redirect_to project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: project }
      else
        format.html { render :new }
        format.json { render json: project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/projects/1
  # PATCH/PUT /admin/projects/1.json
  def update
    respond_to do |format|
      if project.update(admin_project_params)
        format.html { redirect_to project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: project }
      else
        format.html { render :edit }
        format.json { render json: project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/projects/1
  # DELETE /admin/projects/1.json
  def destroy
    project.destroy
    respond_to do |format|
      format.html { redirect_to admin_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_project
      project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_project_params
      params[:admin_project]
    end
end

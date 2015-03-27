class Admin::MembersController < Admin::BaseController
  expose(:members) { Member.all }
  expose(:member) { Member.find_by_id(params[:id]) || Member.new }

  # POST /admin/members
  # POST /admin/members.json
  def create
    member.attributes = admin_member_params

    respond_to do |format|
      if member.save
        format.html { redirect_to member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: member }
      else
        format.html { render :new }
        format.json { render json: member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/members/1
  # PATCH/PUT /admin/members/1.json
  def update
    respond_to do |format|
      if member.update(admin_member_params)
        format.html { redirect_to member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: member }
      else
        format.html { render :edit }
        format.json { render json: member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/members/1
  # DELETE /admin/members/1.json
  def destroy
    member.destroy
    respond_to do |format|
      format.html { redirect_to admin_members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_member
      member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_member_params
      params[:admin_member]
    end
end

class Admin::MembersController < Admin::BaseController
  before_action :set_admin_member, only: [:show, :edit, :update, :destroy]

  # GET /admin/members
  # GET /admin/members.json
  def index
    @admin_members = Admin::Member.all
  end

  # GET /admin/members/1
  # GET /admin/members/1.json
  def show
  end

  # GET /admin/members/new
  def new
    @admin_member = Admin::Member.new
  end

  # GET /admin/members/1/edit
  def edit
  end

  # POST /admin/members
  # POST /admin/members.json
  def create
    @admin_member = Admin::Member.new(admin_member_params)

    respond_to do |format|
      if @admin_member.save
        format.html { redirect_to @admin_member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @admin_member }
      else
        format.html { render :new }
        format.json { render json: @admin_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/members/1
  # PATCH/PUT /admin/members/1.json
  def update
    respond_to do |format|
      if @admin_member.update(admin_member_params)
        format.html { redirect_to @admin_member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_member }
      else
        format.html { render :edit }
        format.json { render json: @admin_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/members/1
  # DELETE /admin/members/1.json
  def destroy
    @admin_member.destroy
    respond_to do |format|
      format.html { redirect_to admin_members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_member
      @admin_member = Admin::Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_member_params
      params[:admin_member]
    end
end

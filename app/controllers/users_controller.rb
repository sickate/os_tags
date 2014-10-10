class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if params[:search].blank?
      if params[:tag].nil?
        # filter
        @group = Group.find(params[:group_id]) unless params[:group_id].nil?
        @project = Project.find(params[:project_id]) unless params[:project_id].nil?
        @office = Group.find(params[:office_id]) unless params[:office_id].nil?
        @role = Role.find(params[:role_id]) unless params[:role_id].nil?

        @groups = Group.all
        @projects = Project.all
        @offices = Office.all
        @roles = Role.all

        @users = User.of_group(@group).in_office(@office).on_project(@project).of_role(@role)
      else
        @users = User.tagged_with params[:tag]
      end
    else
        @users = User.search params[:search]
    end
    @people = @users
  end

  # GET /users/1
  # GET /users/1.json
  def show

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :description, :avatar, :client_list, :skill_list, :prospect_list, :tag_list, :group_id)
    end
end

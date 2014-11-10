class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def handle_filters
    @group_id = params[:group_id]
    @office_id = params[:office_id]
    @project_id = params[:project_id]
    @person_id = params[:person_id]
    @role_id = params[:role_id]

    @group = Group.find @group_id if @group_id
    @office = Office.find @office_id if @office_id
    @project = Project.find @project_id if @project_id
    @person = People.find @person_id if @person_id
    @role = Role.find @role_id if @role_id

    @group_name = @group.blank? ? 'All' : @group.name
    @office_location = @office.blank? ? 'All' : @office.location
    @project_name = @project.blank? ? 'All' : @project.name
    @person_name = @person.blank? ? 'All' : @person.name
    @role_name = @role.blank? ? 'All' : @role.name
  end
end

class Employee::PermissionsController < Employee::BaseController
  
  before_filter :set_employee
  
  def show
    authorize! :set_permissions, @employee
    @section = params[:section] || 'users'
    @permissions ||= @employee.permissions
  end
  
private
  
  def set_employee
    @employee ||= Employee.find_by_id(params[:id])
  end
  
end
class Employee::PermissionsController < Employee::BaseController
  
  before_filter :set_employee
  
  def show
    authorize! :set_permissions, @employee
    @section = params[:section] || 'users'
    @permissions ||= @employee.permissions
  end
  
  def update
    authorize! :set_permissions, @employee
    
    if params.has_key?(:permissions)
      @employee.permissions.where(subject_class: params[:permission_group]).destroy_all
      build_permissions(params[:permissions])
    end
    
    if @employee.save!
      msg = {:notice => "Permissions have been updated."}
    else
      msg = {:notice => "Permissions have not been updated."}
    end
    
    @employee.reset_ability!
    redirect_to employee_permission_path(@employee, section: (params[:section])), flash: msg
  end
  
private
  
  def set_employee
    @employee ||= Employee.find_by_id(params[:id])
  end
  
  def build_permissions(permissions)
    permissions.each_pair do |klass, perms|
      perms.reject{|k,v| v == 'false'}.keys.each do |perm|
        @employee.permissions.build(:action => perm, :subject_class => klass.camelcase)
      end
    end
  end
  
end
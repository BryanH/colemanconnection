class Employee::PermissionsController < Employee::BaseController
  
  before_filter :set_employee
  
  def show
    authorize! :set_permissions, @employee
    @section = params[:section] || 'users'
    @permissions ||= @employee.permissions
    @audits ||= Audit.where(owner_id: @employee.id, auditable_type: 'Permission').reorder('created_at DESC')
  end
  
  def update
    authorize! :set_permissions, @employee
    
    build_permissions(params[:permissions])
    
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
    reset_permissions(permissions.keys)
    permissions.each_pair do |klass, perms|
      perms.reject{|k,v| v == 'false'}.keys.each do |perm|
        @employee.permissions.build(:action => perm, :subject_class => klass.classify)
      end
    end
  end
  
  def reset_permissions(klasses)
    klasses.each do |klass|
      @employee.permissions.where(subject_class: klass.classify).destroy_all
    end
  end
  
end
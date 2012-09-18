class Employee::UsersController < Employee::BaseController
  
  def index
    isactive = params[:active] ? false : true
    @users = Employee.paginate(page: params[:page]).active(isactive).search(params[:q])
    @audits = Audit.where(auditable_type: "Employee").reorder('created_at DESC').limit(50)
  end
  
  def new
    @user = Employee.new
    authorize! :create, @user
  end
  
  def create
    @user = Employee.new(params[:employee])
    authorize! :create, @user
    
    if @user.save
      redirect_to employee_permission_path(@user), 
      flash: { success: %Q[
#{@user.name} was added successfully. Please perform the following:
<ul>
<li>Have #{@user.name} log in and change their password</li>
<li>Set the permissions for #{@user.name}</li>
</ul>
].html_safe}
    else
      render :new
    end
  end
  
  def edit
    @user = Employee.find_by_id(params[:id])
    authorize! :edit, @user
  end
  
  def update
    @user = Employee.find_by_id(params[:id])
    authorize! :edit, @user
    
    if params[:employee][:password].blank?
      params[:employee].delete(:password)
      params[:employee].delete(:password_confirmation)
      params[:employee].delete(:current_password)
    end
    
    if @user.update_attributes(params[:employee])
      redirect_to edit_employee_user_path(@user), flash: { success: "Account details have been updated for #{@user.name}" }
    else
      render :edit
    end
  end
  
end
class Employee::UsersController < Employee::BaseController
  
  def index
    isactive = params[:active] ? false : true
    @users = Employee.paginate(page: params[:page]).active(isactive).search(params[:q])
  end
  
  def new
    @user = Employee.new
    authorize! :create, @user
  end
  
  def create
    @user = Employee.new(params[:employee])
    authorize! :create, @user
    
    if @user.save
      EmployeeMailer.send_new_account_email(@user)
      redirect_to employee_permission_path(@user), 
      flash: { success: "#{@user.name} was added successfully. Please add permissions for this employee." }
    else
      render :new
    end
  end
  
  def edit
    @user = Employee.find_by_id(params[:id])
    @section = params[:section] || 'account'
    authorize! :edit, @user
    @audits = Audit.where(owner_id: @user.id, auditable_type: 'Employee').reorder('created_at DESC')
  end
  
  def update
    @user = Employee.find_by_id(params[:id])
    authorize! :edit, @user
    
    if params[:employee] && params[:employee][:password].blank?
      params[:employee].delete(:password)
      params[:employee].delete(:password_confirmation)
      params[:employee].delete(:current_password)
    end
    
    if params[:section] == 'programs' && params[:employee].blank?
      params[:employee] = {}
      params[:employee][:program_affiliations] = nil
    end
    
    if @user.update_attributes(params[:employee])
      redirect_to edit_employee_user_path(@user, section: params[:section]), flash: { success: "Account details have been updated for #{@user.name}" }
    else
      render :edit
    end
  end
  
end
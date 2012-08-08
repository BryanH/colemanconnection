class Employee::UsersController < Employee::BaseController
  
  def index
    isactive = params[:active] ? false : true
    @users = Staff.paginate(page: params[:page]).active(isactive).search(params[:q])
  end
  
  def new
    @user = Staff.new
  end
  
  def create
    @user = Staff.new(params[:staff])
    if @user.save
      redirect_to employee_users_path, 
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
    @user = Staff.find_by_id(params[:id])
  end
  
  def update
    @user = Staff.find_by_id(params[:id])
    if @user.update_attributes(params[:staff])
      redirect_to edit_employee_user_path(@user), flash: { success: "Account details have been updated for #{@user.name}" }
    else
      render :edit
    end
  end
  
end
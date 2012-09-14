class Employee::ActivationsController < Employee::BaseController
  
  def create
    @user = Employee.find_by_id(params[:id])
    authorize! :change_active_status, @user
    if @user.activate!
      flash = { success: "The user was activated successfully." }
    else
      flash = { alert: "The user could not be activated. Please try again."}
    end
    redirect_to employee_users_path, flash: flash
  end
  
  def destroy
    @user = Employee.find_by_id(params[:id])
    authorize! :change_active_status, @user
    if @user.deactivate!
      flash = { success: "The user was deactivated successfully." }
    else
      flash = { alert: "The user could not be deactivated. Please try again."}
    end
    redirect_to employee_users_path, flash: flash
  end
  
end
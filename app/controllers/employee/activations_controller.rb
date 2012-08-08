class Employee::ActivationsController < Employee::BaseController
  
  def create
    @user = Staff.find_by_id(params[:id])
    if @user.activate!
      flash = { success: "The user was activated successfully." }
    else
      flash = { alert: "The user could not be activated. Please try again."}
    end
    redirect_to employee_users_path, flash: flash
  end
  
  def destroy
    @user = Staff.find_by_id(params[:id])
    if @user.deactivate!
      flash = { success: "The user was deactivated successfully." }
    else
      flash = { alert: "The user could not be deactivated. Please try again."}
    end
    redirect_to employee_users_path, flash: flash
  end
  
end
class Employee::UsersController < Employee::BaseController
  
  def index
    isactive = params[:active] ? false : true
    offset = params[:offset].to_i || 0
    
    if params[:q]
      @users = Staff.paginate(page: params[:page]).
                     order(:last_name).
                     where{ 
                       active.eq(isactive) & 
                       (
                        first_name.matches("%#{my{params[:q]}}%") | 
                        last_name.matches("%#{my{params[:q]}}%") |
                        email.matches("%#{my{params[:q]}}%")
                       )
                     }
    else
      @users = Staff.paginate(page: params[:page]).order(:last_name).where(active: isactive)
    end
  end
  
end
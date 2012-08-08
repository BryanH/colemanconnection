class Employee::UsersController < Employee::BaseController
  
  def index
    isactive = params[:active] ? false : true
    @users = Staff.paginate(page: params[:page]).active(isactive).search(params[:q])
  end
  
end
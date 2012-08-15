class Employee::ProgramDatesController < Employee::BaseController
  
  def index
    @dates = Hash[ProgramDate.all.group_by(&:program).sort]
  end
  
  def show
    @date = ProgramDate.find_by_id(params[:id])
    @sessions = @date.sessions.search_on_user(params[:q]).includes(:user).order(user: :last_name).page(params[:page])
  end
  
end
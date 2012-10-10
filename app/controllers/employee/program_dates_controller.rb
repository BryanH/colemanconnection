class Employee::ProgramDatesController < Employee::BaseController
  
  def index
    @dates = Hash[ProgramDate.where(program: (current_user.affiliated_programs)).group_by(&:program).sort]
  end
  
  def show
    @date = ProgramDate.find_by_id(params[:id])
    authorize! :view, ProgramDate
    
    @sessions = @date.sessions.search_on_user(params[:q]).includes(:user).order(user: :last_name).page(params[:page])
    @audits = @date.attendance_audits.reorder('created_at DESC')
  end
  
end
class Employee::ProgramDatesController < Employee::BaseController
  
  before_filter :set_program_date, only: [:show, :happiness]
  
  def index
    @dates ||= Hash[ProgramDate.all_with_sessions.where(program: current_user.affiliated_programs).group_by(&:program).sort]
  end
  
  def show
    authorize! :view, ProgramDate
    
    @sessions ||= @date.sessions.search_on_user(params[:q]).includes(:user).order(user: :last_name).page(params[:page])
    @audits ||= @date.attendance_audits.reorder('created_at DESC')
  end
  
  def new
    @program_date = ProgramDate.new
  end
  
  def create
    occurs_on = params[:program_date].delete(:occurs_on)
    @program_date = ProgramDate.new(params[:program_date])
    @program_date.occurs_on = occurs_on
    if @program_date.save
      redirect_to new_employee_program_date_path, notice: 'The program session date was created successfully.'
    else
      render action: :new
    end
  end
  
  def happiness
    authorize! :view, ProgramDate
    
    @completed_survey_results ||= @date.survey_results.not_pending.order(:id)
  end
  
private

  def set_program_date    
    @date ||= ProgramDate.find_by_id(params[:id])
  end
  
end
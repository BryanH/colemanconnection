class Employee::ProgramSessionsController < Employee::BaseController
  before_filter :set_program_date, only: [:show, :happiness]
  
    def index
      program_ids = Program.where(name: current_user.affiliated_programs, active: true).select(:id).collect(&:id)
      @program_dates ||= ProgramDate.all_with_sessions.where{ program_id.in(program_ids) & occurs_on.gte(2.months.ago) }.group_by {|p| p.program_name }.sort
    end
  
    def show
      authorize! :view, ProgramDate
    
      @sessions ||= @date.sessions.search_on_user(params[:q]).includes(:user).order(user: :last_name).page(params[:page])
      @audits ||= (@date.attendance_audits + @date.audits).sort_by(&:created_at).reverse
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
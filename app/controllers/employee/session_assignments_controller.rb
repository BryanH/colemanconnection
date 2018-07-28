class Employee::SessionAssignmentsController < Employee::BaseController
  before_action :find_program_date

  def edit
  end

  def update
    # params[:program_date][:occurs_on] will actually contain the id of the new date
    if @program_date.sessions.update_all(program_date_id: params[:program_date][:occurs_on])
      redirect_to employee_program_dates_path, notice: 'Attendees have been moved successfully'
    else
      flash[:error] = "We couldn't move the sessions. Please contact the system administrator."
      render :edit
    end
  end

  private

  def find_program_date
    @program_date = ProgramDate.find(params[:id])
  end
end

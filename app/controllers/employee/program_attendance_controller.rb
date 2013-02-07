class Employee::ProgramAttendanceController < Employee::BaseController
  
  def create
    authorize! :mark_attendance, ProgramDate
    @program_date = ProgramDate.find(params[:id])
    
    render json: { success: @program_date.no_attendance! }
  end
  
  def destroy
    authorize! :mark_attendance, ProgramDate
    @program_date = ProgramDate.find(params[:id])
    
    render json: { success: @program_date.attendance! }
  end
  
end
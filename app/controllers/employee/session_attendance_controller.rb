class Employee::SessionAttendanceController < Employee::BaseController
  
  def create
    @session = Session.find_by_id(params[:id])
    render json: { success: @session.attended! }
  end
  
  def destroy
    @session = Session.find_by_id(params[:id])
    render json: { success: @session.not_attended! }
  end
  
end
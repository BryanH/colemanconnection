class  Candidate::ProgramSessionsController < Candidate::BaseController
  
  def new
    @session = current_user.sessions.build
  end
  
  def create
    @session = current_user.sessions.build(params[:session])
    if @session.save
      redirect_to candidate_program_sessions_path(current_user), notice: "You are registered!"
    else
      render :new
    end
  end
  
  def destroy
    @session = current_user.sessions.find_by_id(params[:id])
    if @session.destroy
      msg = { notice: "You are no longer registered for that session." }
    else
      msg = { alert: "Oops, something went wrong. We could not remove you from that session." }
    end
    redirect_to candidate_program_sessions_path, flash: msg
  end
  
  def date_list
    @program_dates = ProgramDate.where{program.eq(my{params[:program]}) & occurs_on.gt(Time.now.end_of_day)}
    render partial: '/candidate/program_sessions/date_list', collection: @program_dates, as: :date
  end
end
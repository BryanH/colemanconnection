class  Students::ProgramSessionsController < Students::BaseController
  
  def new
    @session = current_user.sessions.build
  end
  
  def create
    @session = current_user.sessions.build(params[:session])
    if @session.save
      redirect_to students_program_sessions_path(current_user), notice: "You are registered!"
    else
      render :new
    end
  end
  
  def date_list
    @program_dates = ProgramDate.where{program.eq(my{params[:program]}) & occurs_on.gte(Time.now)}
    render partial: '/students/program_sessions/date_list', collection: @program_dates, as: :date
  end
end
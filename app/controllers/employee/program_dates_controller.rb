class Employee::ProgramDatesController < Employee::BaseController
  
  before_filter :set_program_date, only: [:show, :edit, :update, :destroy, :happiness]
  
  def index
    @programs = Program.search(params[:q]).where(active: true).page(params[:page]).per_page(5)
    @program_dates ||= ProgramDate.all_with_sessions.where{ program_id.in(my{@programs.collect(&:id)}) & occurs_on.gte(2.months.ago) }.group_by {|p| p.program_name }.sort
  end
  
  def new
    @program_date = ProgramDate.new
    @schedule = IceCube::Schedule.new(Chronic.parse("September 1st"), end_time: (Chronic.parse("September 1st") + 1.year))
    @schedule.add_recurrence_rule IceCube::Rule.monthly.day_of_week(thursday: [1]).hour_of_day(17).minute_of_hour(30)
    @schedule.add_recurrence_rule IceCube::Rule.monthly.day_of_week(thursday: [3]).hour_of_day(12).minute_of_hour(00)
  end
  
  def create
    unless params[:program_date][:program_id] && params[:session_dates]
      redirect_to new_employee_program_date_path, alert: "You must specify a program and at least one session time" and return
    end
    
    @program = Program.find(params[:program_date][:program_id])
    if @program
      params[:session_dates].each do |session_date|
        next if @program.program_dates.exists?(session_date)
        @program.program_dates.create(occurs_on: session_date)
      end
    end
    redirect_to new_employee_program_date_path, notice: 'The program sessions were created successfully.'
  end
  
  def edit
  end
  
  def update
    if @program_date.update_attributes(params[:program_date])
      redirect_to employee_program_dates_path, notice: 'The program session date was updated successfully.'
    else
      render :edit
    end
  end
  
  def destroy
    if @program_date.destroy
      redirect_to employee_program_dates_path, notice: 'The program session date has been cancelled.'
    else
      redirect_to employee_program_dates_path, alert: 'The program session date could not be cancelled.'
    end
  end
  
private

  def set_program_date    
    @program_date ||= ProgramDate.find_by_id(params[:id])
  end
  
end
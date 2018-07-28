class Employee::ProgramDatesController < Employee::BaseController

  before_action :set_program_date, only: [:show, :edit, :update, :destroy, :happiness]

  def index
    @programs = Program.search(params[:q]).where(active: true)
    @program_dates ||= ProgramDate.all_with_sessions.where{ program_id.in(my{@programs.collect(&:id)}) & occurs_on.gte(2.months.ago) }.group_by {|p| p.program_name }.sort
  end

  def new
    @program_date = ProgramDate.new
  end

  def create
    @program_date = ProgramDate.new(params[:program_date])
    if @program_date.save
      redirect_to new_employee_program_date_path, notice: 'The program sessions were created successfully.'
    else
      render action: :new
    end
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

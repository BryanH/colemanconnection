class Employee::ProgramActivationsController < Employee::BaseController
  before_action :get_program, only: [:create, :destroy]

  def create
    @program.active = true
    if @program.save
      redirect_to employee_programs_path, notice: "The program has been activated."
    else
      redirect_to employee_programs_path, alert: "The program could not be activated: #{$!}"
    end
  end


  def destroy
    @program.active = false
    if @program.save
      redirect_to employee_programs_path, notice: "The program has been deactivated."
    else
      redirect_to employee_programs_path, alert: "The program could not be deactivated: #{$!}"
    end
  end

private

  def get_program
    @program = Program.find(params[:id])
  end
end

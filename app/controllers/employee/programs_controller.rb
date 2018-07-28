class Employee::ProgramsController < Employee::BaseController
  before_action :set_program, only: [:edit, :update]

  def index
    @programs = Program.order(:name).search(params[:q]).paginate(page: params[:page])
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(params[:program])
    if @program.save
      redirect_to [:employee, :programs], notice: "Program was added successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @program.update_attributes(params[:program])
      redirect_to [:employee, :programs], notice: "Program was updated successfully."
    else
      render :edit
    end
  end

private

  def set_program
    @program = Program.find(params[:id])
  end
end

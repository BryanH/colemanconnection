class Employee::DisciplineTeamsController < Employee::BaseController

  before_action :set_discipline_team, only: [:edit, :update]

  def index
    @discipline_teams = DisciplineTeam.paginate(page: params[:page]).order(:name).search(params[:q])
  end

  def new
    @discipline_team = DisciplineTeam.new
  end

  def create
    @discipline_team = DisciplineTeam.new(params[:discipline_team])
    if @discipline_team.save
      redirect_to employee_discipline_teams_path,
      flash: { success: "#{@discipline_team.name} was added successfully." }
    else
      render :new
    end
  end

  def update
    if @discipline_team.update_attributes(params[:discipline_team])
      redirect_to employee_discipline_teams_path, notice: "Successfully updated."
    else
      render :edit
    end
  end

private

  def set_discipline_team
    @discipline_team = DisciplineTeam.find(params[:id])
  end
end

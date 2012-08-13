class Employee::CandidatesController < Employee::BaseController
  
  def index
    @candidates = Candidate.paginate(page: params[:page]).search(params[:q])
  end
  
  def show
    @candidate = Candidate.find_by_id(params[:id])
    @section = params.delete(:section) || 'demographics'
  end
  
  def edit
    @candidate = Candidate.find_by_id(params[:id])
  end
  
  def update
    @candidate = Candidate.find_by_id(params[:id])
    if @candidate.update_attributes(params[:candidate])
      redirect_to employee_candidate_path(@candidate), flash: { success: "The email was updated successfully." }
    else
      render :edit
    end
  end
  
end
class Employee::CandidatesController < Employee::BaseController
  
  def index
    @candidates = Candidate.paginate(page: params[:page]).search(params[:q])
  end
  
  def show
    @candidate = Candidate.find_by_id(params[:id])
    @section = params[:section] || 'demographics'
  end
  
end
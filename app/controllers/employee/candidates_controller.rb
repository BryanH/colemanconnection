class Employee::CandidatesController < Employee::BaseController
  
  def index
    @candidates = Candidate.paginate(page: params[:page]).search(params[:q])
  end
  
end
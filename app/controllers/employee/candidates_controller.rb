class Employee::CandidatesController < Employee::BaseController
  
  def index
    @candidates = Candidate.paginate(page: params[:page]).search(params[:q])
    @audits = Audit.where(auditable_type: 'Candidate').reorder('created_at DESC').limit(100)
  end
  
  def show
    @candidate = Candidate.find_by_id(params[:id])
    @section = params.delete(:section) || 'demographics'
    if @section == 'peoplesoft' && @candidate.demographic && @candidate.demographic.hcc_student_id.present?
      @peoplesoft_candidate ||= WSDL::PeopleSoft.new(@candidate.demographic.hcc_student_id.to_i)
      @details ||= @peoplesoft_candidate.details rescue nil
    end
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
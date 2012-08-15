class Employee::ProgramDatesController < Employee::BaseController
  
  def index
    @dates = Hash[ProgramDate.all.group_by(&:program).sort]
  end
  
end
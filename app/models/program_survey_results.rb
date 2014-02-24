class ProgramSurveyResults
  
  attr_reader :program
  
  def initialize(program)
    @program = program
  end
  
  def great_count
    program.survey_results.where(result: 'great').count
  end
  
  def pending_count
    program.survey_results.where(result: 'pending').count
  end
  
  def okay_count
    program.survey_results.where(result: 'okay').count
  end
  
  def bad_count
    program.survey_results.where(result: 'bad').count
  end
  
  def total_count
    program.survey_results.count
  end
  
end
module SurveyResultsHelper
  
  def survey_heading(survey_result)
    self.send "header_#{survey_result.result}".to_sym
  end
  
private

  def header_great
    "We're glad you had a great experience!"
  end
  
  def header_okay
    "Sorry to hear it was just okay. Can you tell us what we could've done better?"
  end
  
  def header_bad
    "We're really sorry to hear that you had a bad experience. Please share with us what caused you to feel that way."
  end
  
end
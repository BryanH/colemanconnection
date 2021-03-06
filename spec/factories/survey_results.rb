# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :survey_result do
    result 'pending'
    token  { SurveyResult.generate_token }
    program_date
  end
end

# == Schema Information
#
# Table name: survey_results
#
#  id              :integer          not null, primary key
#  result          :string(255)      not null
#  comment         :text
#  token           :string(255)      not null
#  program_date_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :survey_result do
    result 'pending'
    token  { SurveyResult.generate_token }
    program_date
  end
end

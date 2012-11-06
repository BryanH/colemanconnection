# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey_result do
    result "MyString"
    token "MyString"
    program_date
  end
end

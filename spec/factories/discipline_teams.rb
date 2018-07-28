# == Schema Information
#
# Table name: discipline_teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :discipline_team do
    name "MyString"
    team_color "MyString"
  end
end

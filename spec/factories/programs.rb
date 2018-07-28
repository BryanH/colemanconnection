# == Schema Information
#
# Table name: programs
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  discipline_team_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  active             :boolean          default(TRUE)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :program do
    name "MyString"
    discipline_team nil
  end
end

# == Schema Information
#
# Table name: program_dates
#
#  id             :integer          not null, primary key
#  program_string :string(255)
#  occurs_on      :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  no_attendance  :boolean          default(FALSE)
#  program_id     :integer
#

FactoryBot.define do
  sequence :occurs_on do |n|
    n.months.from_now
  end

  factory :program_date do
    occurs_on
    program_string { ProgramOfferings.programs.sample }
    program
  end
end

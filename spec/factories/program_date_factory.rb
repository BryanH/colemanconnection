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

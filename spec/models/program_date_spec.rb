# == Schema Information
#
# Table name: program_dates
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  occurs_on  :date
#  program    :string(255)
#  updated_at :datetime         not null
#

require 'spec_helper'

describe ProgramDate do
  let(:program_date) { ProgramDate.new }
  subject { program_date }

  it { should be_valid }
  it { should respond_to(:program) }
  it { should respond_to(:occurs_on) }

  it { should have_many(:sessions) }
  it { should have_many(:candidates) }
  
  context 'existing program date' do
    let(:program_time) { Chronic.parse("Oct 4th @ 5:30pm") }
    let(:porogram_date) { ProgramDate.new }
    before { ProgramDate.create!(program: 'Biosafety', occurs_on: program_time) }
    it { should validate_uniqueness_of(:occurs_on).scoped_to(:program) }
  end
end

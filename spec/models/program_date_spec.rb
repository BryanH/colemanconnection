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

require 'spec_helper'

describe ProgramDate do
  let(:program_date) { FactoryGirl.create(:program_date) }
  subject { program_date }

  it { should be_valid }
  it { should respond_to(:program_string) }
  it { should respond_to(:occurs_on) }
  it { should respond_to(:no_attendance!) }
  it { should respond_to(:attendance!) }

  it { should have_many(:sessions) }
  it { should have_many(:candidates) }
  
  context 'existing program date' do
    let(:program_time) { Chronic.parse("Oct 4th @ 5:30pm") }
    let(:program_date) { FactoryGirl.create(:program_date) }
    before { ProgramDate.create!(occurs_on: program_time, program_id: program_date.program_id) }
    it { should validate_uniqueness_of(:occurs_on).scoped_to(:program_id) }
  end
end

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
end

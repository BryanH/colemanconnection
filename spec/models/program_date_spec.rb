require 'spec_helper'

describe ProgramDate do
  let(:program_date) { ProgramDate.new }
  subject { program_date }

  it { should be_valid }
  it { should respond_to(:program) }
  it { should respond_to(:occurs_on) }

  it { should have_many(:sessions) }
  it { should have_many(:students) }
end

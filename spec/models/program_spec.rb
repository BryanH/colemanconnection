require 'spec_helper'

describe Program do
  let(:program) { Program.new }
  subject { program }
  
  it { should respond_to :name }
  it { should respond_to :discipline_team}
  it { should respond_to :color }
  
  context 'existing program' do
    before do
      Program.create!(name: 'Bork')
    end
    
    it { should validate_uniqueness_of :name}
  end
end

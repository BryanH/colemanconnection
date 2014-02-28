require 'spec_helper'

describe Program do
  let(:program) { Program.new }
  subject { program }
  
  context 'a new instance' do
  it { should respond_to :name }
    it { should respond_to :discipline_team}
    it { should respond_to :color }
    it { should respond_to :active }
    
    it 'should be active' do
      expect(:active).to be_true
    end
  end
  
  context 'existing program' do
    before do
      Program.create!(name: 'Bork')
    end
    
    it { should validate_uniqueness_of :name}
  end
end

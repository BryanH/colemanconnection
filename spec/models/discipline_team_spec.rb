require 'spec_helper'

describe DisciplineTeam do
  let(:discipline_team) { DisciplineTeam.new }
  subject { discipline_team }
  
  it { should respond_to :name}
  it { should respond_to :color}
  
  context 'existing team' do
    before do
      DisciplineTeam.create!(name: "Bork")
    end
    
    it { should validate_uniqueness_of :name }
  end
end

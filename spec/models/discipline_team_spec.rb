# == Schema Information
#
# Table name: discipline_teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

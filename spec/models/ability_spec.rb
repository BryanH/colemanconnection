require 'spec_helper'
require 'cancan/matchers'

describe Employee do
  describe 'abilities' do
    subject { ability }
    let(:ability) { Ability.new(user) }
    
    context 'for the overlord' do
      let(:user) { FactoryGirl.create(:employee, :overlord) }
      
      it { should be_able_to(:manage, :all) }
    end
    
    context 'for a user with all abilities turned off' do
      let(:user) { FactoryGirl.create(:employee) }
      
      it { should_not be_able_to(:manage, Employee) }
      it { should_not be_able_to(:manage, Candidate) }
      it { should_not be_able_to(:manage, ProgramDate) }
      it { should_not be_able_to(:manage, Session) }
      it { should_not be_able_to(:audit, :all) }
    end
    
    context 'for a user with all abilities turned on for Employees' do
      let(:user) { FactoryGirl.create(:employee) }
      let(:employee) { FactoryGirl.create(:employee) }
      
      [:view, :edit, :create, :change_active_status, :set_permission].each do |action|
        it "should be allowed to #{action}Employee" do
          user.permissions.create!(action: action, subject_class: 'Employee')
          ability.should be_able_to(action, employee)
        end
      end
    end
    
    context 'for a user with all abilities turned on for Candidates' do
      let(:user) { FactoryGirl.create(:employee) }
      let(:candidate) { FactoryGirl.create(:candidate) }
      
      [:view, :edit, :view_peoplesoft_data].each do |action|
        it "should be allowed to #{action}" do
          user.permissions.create!(action: action, subject_class: 'Candidate')
          ability.should be_able_to(action, candidate)
        end
      end
    end
    
    context 'for a user with all abilities turned on for Program Sessions' do
      let(:user) { FactoryGirl.create(:employee) }
      let(:program_session) { FactoryGirl.create(:program_date) }
      
      [:view, :mark_attendance].each do |action|
        it "should be allowed to #{action}" do
          user.permissions.create!(action: action, subject_class: 'ProgramDate')
          ability.should be_able_to(action, program_session)
        end
      end
    end
    
    context 'for a user with all abilities turned on for Reporting' do
      let(:user) { FactoryGirl.create(:employee) }
      
      [:audit].each do |action|
        it "should be allowed to #{action}" do
          user.permissions.create!(action: action, subject_class: 'all')
          ability.should be_able_to(action, :all)
        end
      end
    end
    
  end
end
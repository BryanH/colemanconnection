require 'spec_helper'

describe Employee::CandidatesController do
  context 'as logged in employee' do
    let(:employee) { FactoryGirl.create(:employee) }
    before { sign_in employee }
    after { sign_out employee }
    
    describe '#index' do
      before { get :index }
      
      it { should render_template(:index) }
      it { should respond_with(:success) }
      it { should assign_to(:candidates) }
    end
    
    describe '#show' do
      let(:candidate) { FactoryGirl.create(:candidate) }
      before { get :show, id: candidate.id }
      
      it { should render_template(:show) }
      it { should respond_with(:success) }
      it { should assign_to(:candidate) }
      it { should assign_to(:section) }
    end
    
    describe '#edit' do
      let(:candidate) { FactoryGirl.create(:candidate) }
      before { get :edit, id: candidate.id }
      
      it { should render_template(:edit) }
      it { should respond_with(:success) }
      it { should assign_to(:candidate) }
    end
  end
end
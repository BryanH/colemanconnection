require 'spec_helper'

describe Employee::ProgramDatesController do
  context 'employee signed in' do
    let(:employee) { FactoryGirl.create(:employee) }
    let(:other_employee) { FactoryGirl.create(:employee) }
    before { sign_in employee }
    after { sign_out employee }

    describe '#index' do
      before { get :index }

      it { should render_template(:index) }
      it { should respond_with(:success) }
      it { should assign_to(:dates) }
    end
    
    describe '#show' do
      let(:program_date) { FactoryGirl.create(:program_date) }
      before { get :show, id: program_date.id }

      it { should render_template(:show) }
      it { should respond_with(:success) }
      it { should assign_to(:date) }
      it { should assign_to(:sessions) }
    end
  end
end
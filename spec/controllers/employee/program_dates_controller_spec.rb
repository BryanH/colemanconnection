require 'spec_helper'

describe Employee::ProgramDatesController do
  context 'employee signed in' do
    let(:employee) { FactoryGirl.create(:employee, :overlord) }
    before { sign_in employee }
    after { sign_out employee }

    describe '#index' do
      before { get :index }

      it { should render_template(:index) }
      it { should respond_with(:success) }
      it { should assign_to(:program_dates) }
    end
    
    describe '#edit' do
      let(:program_date) { FactoryGirl.create(:program_date) }
      before { get :edit, id: program_date.id }
      
      it { should render_template(:edit) }
      it { should respond_with(:success) }
      it { should assign_to(:program_date) }
    end
    
    describe '#update' do
      let(:program_date) { FactoryGirl.create(:program_date, occurs_on: Chronic.parse('1 day from now at noon')) }
      before { post :update, id: program_date.id, program_date: { occurs_on: Chronic.parse('5 days from now at noon') } }
      
      it { should respond_with(:redirect) }
      it "should have updated the value for occurs_on" do
        expect(program_date.reload.occurs_on).to eq(Chronic.parse('5 days from now at noon'))
      end
    end
    
    describe '#destroy' do
      let!(:program_date) { FactoryGirl.create(:program_date) }
      
      it 'should remove the date' do
        expect { delete :destroy, id: program_date.id }.to change(ProgramDate, :count).by(-1)
      end
    end
  end
end
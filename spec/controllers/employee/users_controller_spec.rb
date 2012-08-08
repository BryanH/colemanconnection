require 'spec_helper'

describe Employee::UsersController do
  context 'employee signed in' do
    let(:employee) { FactoryGirl.create(:employee) }
    let(:other_employee) { FactoryGirl.create(:employee) }
    before { sign_in employee }
    after { sign_out employee }

    describe '#index' do
      before { get :index }

      it { should render_template(:index) }
      it { should respond_with(:success) }
      it { should assign_to(:users) }
    end
    
    describe '#edit' do
      before { get :edit, id: other_employee.id }
      
      it { should render_template(:edit) }
      it { should respond_with(:success) }
      it { should assign_to(:user) }
    end
    
    describe '#new' do
      before { get :new }
      
      it { should render_template(:new) }
      it { should respond_with(:success) }
      it { should assign_to(:user) }
    end
  end
end
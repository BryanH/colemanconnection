require 'spec_helper'

describe Employee::UsersController do
  context 'employee signed in' do
    let(:employee) { FactoryGirl.create(:employee, :overlord) }
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
    
    describe '#create' do
      before { get :create, employee: { first_name: 'Test', last_name: 'Test', email: 'testtest@example.com', password: 'secret', password_confirmation: 'secret'} }
      
      it { should redirect_to(employee_permission_path(Employee.find_by_email('testtest@example.com'))) }
      it { should respond_with(:redirect) }
      it { should assign_to(:user) }
    end
  end
end
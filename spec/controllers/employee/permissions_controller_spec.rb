require 'spec_helper'

describe Employee::PermissionsController do
  context 'employee who can set permissions' do
    let(:employee) { FactoryGirl.create(:employee, :who_can_set_permissions) }
    let(:other_employee) { FactoryGirl.create(:employee) }
    before { sign_in employee }
    after { sign_out employee }

    describe '#show' do
      before { get :show, id: other_employee.id }

      it { should render_template(:show) }
      it { should respond_with(:success) }
      it { should assign_to(:employee) }
    end
  end
  
  context 'employee who cannot set permissions' do
    let(:employee) { FactoryGirl.create(:employee) }
    let(:other_employee) { FactoryGirl.create(:employee) }
    before { sign_in employee }
    after { sign_out employee }
    
    describe '#show' do
      it "should raise CanCan::AccessDenied exception" do
        -> { get :show, id: other_employee.id }.should raise_exception(CanCan::AccessDenied)
      end
    end
  end
end
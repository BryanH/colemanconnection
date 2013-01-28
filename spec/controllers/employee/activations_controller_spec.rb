require 'spec_helper'

describe Employee::ActivationsController do
  context 'employee signed in' do
    let(:employee) { FactoryGirl.create(:employee, :overlord) }
    before { sign_in employee }
    after { sign_out employee }

    describe '#create' do
      let(:other_employee) { FactoryGirl.create(:employee, :inactive) }
      before { post :create, id: other_employee.id }

      it "should activate the employee" do
        expect(other_employee.reload).to be_active
      end
    end
    
    describe '#destroy' do
      let(:other_employee) { FactoryGirl.create(:employee, :active) }
      before { delete :destroy, id: other_employee.id }
      
      it "should deactivate the employee" do
        expect(other_employee.reload).to_not be_active
      end
    end
  end
end
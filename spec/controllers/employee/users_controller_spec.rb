require 'spec_helper'

describe Employee::UsersController do
  context 'employee signed in' do
    let(:employee) { FactoryGirl.create(:employee) }
    before { sign_in employee }
    after { sign_out employee }

    describe '#index' do
      before { get :index }

      it { should render_template(:index) }
      it { should respond_with(:success) }
      it { should assign_to(:users) }
    end
  end
end
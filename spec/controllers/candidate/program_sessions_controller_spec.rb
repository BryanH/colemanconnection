require 'spec_helper'

describe Candidate::ProgramSessionsController do
  context "as a logged in candidate" do
    let(:candidate) { FactoryGirl.create(:candidate) }
    before { sign_in candidate }
    after { sign_out candidate }
    
    describe '#new' do
      before { get :new }
      
      it { should render_template(:new) }
      it { should assign_to(:session) }
      it { should respond_with(:success) }
    end
    
    describe '#destroy' do
      let(:program_session) { FactoryGirl.create(:program_session, user_id: candidate.id) }
      before { delete :destroy, id: program_session.id }
      
      it { should redirect_to(candidate_program_sessions_path) }
      it { should respond_with(:redirect) }
      it { Session.exists?(id: program_session.id).should be_false }
    end
  end
end
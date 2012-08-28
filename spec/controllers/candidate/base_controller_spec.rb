require 'spec_helper'

describe Candidate::BaseController do
  
  context "logged in candidate" do
    let(:candidate) { FactoryGirl.create(:candidate) }
    before { sign_in candidate }
    after { sign_out candidate }
    
    describe '#index' do
      before { get :index }
      
      it { should render_template(:index) }
    end
  end
  
  context "not logged in" do
    before { get :index }
    
    it { should redirect_to(new_user_session_path) }
  end
  
end
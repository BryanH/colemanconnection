require 'spec_helper'

describe SurveyResultsController do
  describe '#index' do
    context 'survey result exists with token but no comments' do   
      it_should_behave_like 'a call to index' do
        it { should respond_with(:redirect) }
        it { should redirect_to(edit_survey_result_path(survey_result.token)) }
      end
    end
    
    context 'survey result exists with comments' do
      it_should_behave_like 'a call to index' do
        let!(:survey_result) { FactoryGirl.create(:survey_result, token: token, comment: "It was great") }
        it { should respond_with(:redirect) }
        it { should redirect_to(survey_result_path(survey_result.token)) }
      end
    end
    
    context 'survey result does not exist' do
      it_should_behave_like 'a call to index' do
        let!(:survey_result) { nil }
        let!(:token) { 'notavalidtoken' }
        it { should respond_with(:redirect) }
        it { should redirect_to(root_path) }
      end
    end
  end
  
  describe '#show' do
    let(:survey_result) { FactoryGirl.create(:survey_result, comment: 'It was great') }
    before { get :show, id: survey_result.token }
    
    it { should render_template(:show) }
    it { should assign_to(:survey_result) }
    it { assigns(:survey_result).should == survey_result }
  end
  
  describe '#edit' do
    let(:survey_result) { FactoryGirl.create(:survey_result) }
    before { get :edit, id: survey_result.token }
    
    it { should render_template(:edit) }
    it { should assign_to(:survey_result) }
    it { assigns(:survey_result).should == survey_result }
  end
  
  describe '#update' do
    let(:survey_result) { FactoryGirl.create(:survey_result) }
    before { get :update, id: survey_result.token, survey_result: { comment: 'It was great' } }
    
    it { should assign_to(:survey_result) }
    it { should respond_with(:redirect) }
    it { should redirect_to(survey_result_path(survey_result.token)) }
    it { assigns(:survey_result).comment.should == 'It was great' }
  end
end
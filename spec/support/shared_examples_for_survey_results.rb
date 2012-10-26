shared_examples "a call to index" do
  let!(:token) { SurveyResult.generate_token }
  let!(:survey_result) { FactoryGirl.create(:survey_result, token: token) }
  before { get :index, survey_token: token }
  
  it { should assign_to(:survey_result) }
  it { should assign_to(:survey_token) }
end

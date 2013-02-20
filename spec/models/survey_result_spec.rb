require 'spec_helper'

describe SurveyResult do
  subject { SurveyResult }
  
  it { should respond_to(:generate_token) }
  it { should respond_to(:happiness_counts) }
  it { should respond_to(:programs_without_surveys) }
  
  describe "instance" do
    let(:survey_result) { FactoryGirl.create(:survey_result) }
    subject  { survey_result }

    it { should respond_to(:result) }
    it { should respond_to(:comment) }
    it { should respond_to(:token) }
    it { should respond_to(:program_date_id) }

    it { should validate_uniqueness_of(:token) }
    it { should validate_presence_of(:token) }
  end
  
end
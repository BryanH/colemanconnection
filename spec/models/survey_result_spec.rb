# == Schema Information
#
# Table name: survey_results
#
#  id              :integer          not null, primary key
#  result          :string(255)      not null
#  comment         :text
#  token           :string(255)      not null
#  program_date_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe SurveyResult do
  subject { SurveyResult }
  
  it { should respond_to(:generate_token) }
  
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

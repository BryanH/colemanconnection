# == Schema Information
#
# Table name: er_dates
#
#  cap            :integer
#  created_at     :datetime
#  emails_sent_at :datetime
#  id             :integer          not null, primary key
#  open           :boolean
#  session_time   :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe ErDate do
  let(:er_date) { ErDate.new }
  subject { er_date }
  
  it { should respond_to(:cap) }
  it { should respond_to(:emails_sent_at) }
  it { should respond_to(:open) }
  it { should respond_to(:session_time) }
  
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  
  it { should validate_presence_of(:cap) }
  it { should validate_presence_of(:session_time) }
  
  context "sessiont_time should be unique" do
    before { FactoryGirl.create(:er_date) }
    it { should validate_uniqueness_of(:session_time) }
  end
end

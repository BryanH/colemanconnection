# == Schema Information
#
# Table name: sessions
#
#  arrival_acknowledgement :boolean
#  attended                :boolean
#  breakout_session        :text
#  cancelled_at            :datetime
#  created_at              :datetime
#  details                 :text
#  er_date_id              :integer
#  id                      :integer          not null, primary key
#  updated_at              :datetime
#  user_id                 :integer
#

require 'spec_helper'

describe Session do
  let(:er_session) { Session.new }
  subject { er_session }
  
  it { should respond_to(:arrival_acknowledgement) }
  it { should respond_to(:attended) }
  it { should respond_to(:breakout_session) }
  it { should respond_to(:cancelled_at) }
  it { should respond_to(:details) }
  it { should respond_to(:er_date_id) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:user_id) }
  
  it { should belong_to(:er_date) }
  it { should belong_to(:user) }
  it { should belong_to(:program_date) }
  
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:er_date_id) }
  it { should validate_presence_of(:breakout_session) }
end

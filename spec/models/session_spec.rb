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
#  program_date_id         :integer
#  updated_at              :datetime
#  user_id                 :integer
#

require 'spec_helper'

describe Session do
  let(:er_session) { Session.new }
  subject { er_session }
  
  context "instance" do
    it { should respond_to(:arrival_acknowledgement) }
    it { should respond_to(:attended) }
    it { should respond_to(:breakout_session) }
    it { should respond_to(:cancelled_at) }
    it { should respond_to(:details) }
    it { should respond_to(:er_date_id) }
    it { should respond_to(:updated_at) }
    it { should respond_to(:user_id) }
    it { should respond_to(:program_date_program) }
    it { should respond_to(:program_date_occurs_on) }
    it { should respond_to(:user_reversed_name) }
    it { should respond_to(:user_email) }

    it { should belong_to(:er_date) }
    it { should belong_to(:user) }
    it { should belong_to(:program_date) }

    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:program_date_id) }
    
    context "scoped by user" do
      describe '#program_date_id' do
        it "should be unique" do
          Session.create(user_id: 1, program_date_id: 1)
          
          expect(Session.new(user_id: 1, program_date_id: 1)).to_not be_valid
          expect(Session.new(user_id: 2, program_date_id: 1)).to be_valid
        end
      end
    end
  end

end

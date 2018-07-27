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

FactoryBot.define do
  factory :er_date do
    cap           250
    session_time  Time.now
  end
end

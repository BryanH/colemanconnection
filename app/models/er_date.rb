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

class ErDate < ActiveRecord::Base
  
  validates :cap,           presence: true
  validates :session_time,  presence: true,
                            uniqueness: true
  
end

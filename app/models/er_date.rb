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

# This class is deprecated. This is just being kept around
# for legacy data
class ErDate < ActiveRecord::Base
  
  has_many :sessions
  
  validates :cap,           presence: true
  validates :session_time,  presence: true,
                            uniqueness: true
  
end

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

class Session < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :er_date
  belongs_to :program_date
  
  validates :user_id,           presence: true
  validates :er_date_id,        presence: true
  validates :breakout_session,  presence: true
  
end

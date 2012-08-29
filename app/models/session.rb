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
  
  attr_accessor :program_name
  
  attr_accessible :user_id, :program_name, :program_date_id
  
  belongs_to :user
  belongs_to :er_date
  belongs_to :program_date
  
  validates :user_id,           presence: true
  validates :program_date_id,   presence: true, 
                                numericality: { message: "is not a valid session time"},
                                uniqueness: { scope: :user_id, message: "You are already registered for the selected time"}
  
  scope :search_on_user, lambda { |query| joins(:user).where{ user.first_name.matches("%#{query}%") | 
                                        user.last_name.matches("%#{query}%") |
                                        user.email.matches("%#{query}%") }}
  
  audit(:update, only: :attended) { |session, user, action| session.snitches_on(user).for_marking_attendance }
  
  def attended!
    self.attended = true
    self.save!
  end
  
  def not_attended!
    self.attended = false
    self.save!
  end
  
  def snitches_on(user)
    Snitches::AttendanceSnitch.new(self, user)
  end
  
end
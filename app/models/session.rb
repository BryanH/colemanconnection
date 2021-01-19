# == Schema Information
#
# Table name: sessions
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  er_date_id              :integer
#  details                 :text
#  created_at              :datetime
#  updated_at              :datetime
#  cancelled_at            :datetime
#  breakout_session        :text
#  attended                :boolean          default(FALSE)
#  arrival_acknowledgement :boolean
#  program_date_id         :integer
#

class Session < ApplicationRecord

  attr_accessor :program_name

  # attr_accessorible :user_id, :program_name, :program_date_id

  belongs_to :user
  belongs_to :er_date
  belongs_to :program_date

  delegate :program_string, :program_name, :occurs_on, to: :program_date, prefix: true
  delegate :reversed_name, :email, to: :user, prefix: true

  validates :user_id,           presence: true
  validates :program_date_id,   presence: true,
                                numericality: { message: "is not a valid session time"},
                                uniqueness: { scope: :user_id, message: "You are already registered for the selected time"}

  scope :search_on_user, lambda { |query| joins(:user).where{ user.first_name.matches("%#{query}%") |
                                        user.last_name.matches("%#{query}%") |
                                        user.email.matches("%#{query}%") }}
  scope :attended, lambda { |state| where(attended: state) }
  scope :er_sessions, -> {
	  where { er_date_id.not_eq nil }
  }

  Session.connection

  #audit(:update, only: :attended) { |session, user, action| session.snitches_on(user).for_marking_attendance }

  def self.attendance_rate(end_date = Date.today)
    # We are only concernced with program session attendance, not prior ER sessions
    session_scope = self.joins(:program_date).where{program_date_id.not_eq(nil) & program_date.occurs_on.lt(end_date)}
    percentage = (session_scope.attended(true).count.to_f / session_scope.count.to_f) * 100
    percentage.round(2)
  end

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

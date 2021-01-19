# == Schema Information
#
# Table name: program_dates
#
#  id             :integer          not null, primary key
#  program_string :string(255)
#  occurs_on      :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  no_attendance  :boolean          default(FALSE)
#  program_id     :integer
#

class ProgramDate < ApplicationRecord

#  attr_accessible :program_string, :occurs_on, :program_id

  has_many :sessions
  has_many :candidates, through: :sessions, source: :user
  has_many :attendance_audits, through: :sessions, source: :audits
  has_many :survey_results, dependent: :destroy
  belongs_to :program

  validates :occurs_on, presence: true, uniqueness: { scope: :program_id }
  validates :program_id, presence: true

  default_scope { order('occurs_on ASC') }

  delegate :name, to: :program, prefix: true

  #audit(:update, only: :no_attendance) { |program_date, user, action| program_date.snitches_on(user).for_marking_program_attendance }

  scope :all_with_sessions, -> { select('program_dates.id,
                                    program_dates.program_id,
                                    program_dates.occurs_on,
                                    (
                                      SELECT COUNT(sessions.id)
                                      FROM sessions
                                      WHERE sessions.program_date_id = program_dates.id
                                    ) AS registration_count')
  }

  scope :all_with_attendance, -> { select('program_dates.id,
                                      program_dates.program_id,
                                      program_dates.occurs_on,
                                      program_dates.no_attendance,
                                      (
                                        SELECT COUNT(sessions.id)
                                        FROM sessions
                                        WHERE sessions.program_date_id = program_dates.id
                                        AND sessions.attended = true
                                      ) AS sessions_attended,
                                      (
                                        SELECT COUNT(sessions.id)
                                        FROM sessions
                                        WHERE sessions.program_date_id = program_dates.id
                                        AND sessions.attended = false
                                      ) AS sessions_not_attended')
  }

  def name
    program_name + " " + occurs_on.to_formatted_s(:pretty)
  end

  def no_attendance!
    return false if self.sessions.attended(true).any?
    self.no_attendance = true
    self.save!
  end

  def attendance!
    self.no_attendance = false
    self.save!
  end

  def snitches_on(user)
    Snitches::AttendanceSnitch.new(self, user)
  end

end

# == Schema Information
#
# Table name: program_dates
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  occurs_on  :date
#  program    :string(255)
#  updated_at :datetime         not null
#

class ProgramDate < ActiveRecord::Base
  
  attr_accessible :program, :occurs_on

  has_many :sessions
  has_many :candidates, through: :sessions, source: :user
  has_many :attendance_audits, through: :sessions, source: :audits
  has_many :survey_results, dependent: :destroy
  
  default_scope order('occurs_on ASC')
  
  scope :all_with_sessions, select('program_dates.id, 
                                    program_dates.program, 
                                    program_dates.occurs_on, 
                                    (
                                      SELECT COUNT(sessions.id)
                                      FROM sessions
                                      WHERE sessions.program_date_id = program_dates.id
                                    ) AS registration_count')
  
  def name
    program + " " + occurs_on.to_formatted_s(:pretty)
  end

end

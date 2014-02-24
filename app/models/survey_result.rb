class SurveyResult < ActiveRecord::Base
  
  belongs_to :program_date
  
  attr_accessible :comment, :result, :token
  
  validates :token, uniqueness: true, presence: true
  
  scope :not_pending, where{ result != 'pending' }
  
  def self.generate_token
    begin
      token = SecureRandom.urlsafe_base64
    end while SurveyResult.exists?(token: token) 
    token
  end
  
  def self.happiness_counts
    self.joins(:program_date).select(%Q{
      survey_results.program_date_id,
      program_dates.id,
      program_dates.program_string,
      COUNT(CASE WHEN survey_results.result = 'pending' THEN 1 ELSE NULL END) AS pending_count,
      COUNT(CASE WHEN survey_results.result = 'great' THEN 1 ELSE NULL END) AS great_count,
      COUNT(CASE WHEN survey_results.result = 'okay' THEN 1 ELSE NULL END) AS okay_count,
      COUNT(CASE WHEN survey_results.result = 'bad' THEN 1 ELSE NULL END) AS bad_count,
      COUNT(survey_results.result) AS total_count
    }).group('survey_results.program_date_id, program_dates.id, program_dates.program')
    .order('program_dates.program_string').inject({}) do |h, r|
      unless h.has_key?(r.program_string.to_sym)
        h[r.program_string.to_sym] = {
          pending: r.pending_count.to_i,
          great: r.great_count.to_i,
          okay: r.okay_count.to_i,
          bad: r.bad_count.to_i,
          total: r.total_count.to_i
        }
      else
        h[r.program_string.to_sym][:pending] += r.pending_count.to_i
        h[r.program_string.to_sym][:great] += r.great_count.to_i
        h[r.program_string.to_sym][:okay] += r.okay_count.to_i
        h[r.program_string.to_sym][:bad] += r.bad_count.to_i
        h[r.program_string.to_sym][:total] += r.total_count.to_i
      end
      h
    end
  end
  
  # Return the list of programs that have no survey results. This can happen in
  # one of 2 ways: No candidate has attended the sessions for that program or
  # the program is marking attendance after surveys are sent out.
  def self.programs_without_surveys
    (ProgramOfferings.programs - self.happiness_counts.keys.map(&:to_s))
  end
  
end

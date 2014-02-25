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
  
end

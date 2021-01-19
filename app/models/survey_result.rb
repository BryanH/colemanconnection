# == Schema Information
#
# Table name: survey_results
#
#  id              :integer          not null, primary key
#  result          :string(255)      not null
#  comment         :text
#  token           :string(255)      not null
#  program_date_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class SurveyResult < ApplicationRecord::Base

  belongs_to :program_date

#  attr_accessible :comment, :result, :token

  validates :token, uniqueness: true, presence: true

  scope :not_pending, -> { where{ result != 'pending' } }

  def self.generate_token
    begin
      token = SecureRandom.urlsafe_base64
    end while SurveyResult.exists?(token: token)
    token
  end

end

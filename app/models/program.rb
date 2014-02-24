class Program < ActiveRecord::Base
  attr_accessible :name, :discipline_team_id
  
  belongs_to :discipline_team
  has_many :program_dates
  has_many :survey_results, through: :program_dates
  
  validates :name, uniqueness: true
  
  scope :search, lambda { |query| where{name.matches("%#{query}%")}}
  default_scope order('name ASC')
  
  def color
    discipline_team.try(:color)
  end
end

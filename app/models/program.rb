class Program < ActiveRecord::Base
  attr_accessible :name, :discipline_team_id
  
  belongs_to :discipline_team
  has_many :program_dates
  has_many :survey_results, through: :program_dates
  has_one  :pathway_setting
  
  validates :name, uniqueness: true
  
  scope :search, lambda { |query| where{name.matches("%#{query}%")}}
  default_scope order('name ASC')
  
  delegate :url, :tags, to: :pathway_setting, prefix: true
  
  def color
    discipline_team.try(:color)
  end
  
  def discipline_team_name
    discipline_team.try(:name)
  end
end

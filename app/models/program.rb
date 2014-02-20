class Program < ActiveRecord::Base
  belongs_to :discipline_team
  attr_accessible :name, :discipline_team_id
  
  validates :name, uniqueness: true
  
  scope :search, lambda { |query| where{name.matches("%#{query}%")}}
  
  def color
    discipline_team.try(:color)
  end
end

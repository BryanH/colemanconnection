class Program < ActiveRecord::Base
  belongs_to :discipline_team
  attr_accessible :name
  
  validates :name, uniqueness: true
  
  def color
    discipline_team.try(:color)
  end
end

class Program < ActiveRecord::Base
  belongs_to :discipline_team
  attr_accessible :name, :discipline_team_id
  
  validates :name, uniqueness: true
  
  scope :search, lambda { |query| where{name.matches("%#{query}%")}}
  default_scope order('name ASC')
  
  def color
    discipline_team.try(:color)
  end
end

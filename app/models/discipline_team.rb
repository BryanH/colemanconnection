class DisciplineTeam < ActiveRecord::Base
  attr_accessible :name, :color
  
  validates :name, uniqueness: true
  
  scope :search, lambda { |query| where{name.matches("%#{query}%")}}
end

# == Schema Information
#
# Table name: discipline_teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DisciplineTeam < ApplicationRecord
#  attr_accessible :name, :color

  validates :name, uniqueness: true

  scope :search, lambda { |query| where{name.matches("%#{query}%")}}
end

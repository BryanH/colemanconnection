# == Schema Information
#
# Table name: pathway_settings
#
#  id         :integer          not null, primary key
#  program_id :integer
#  url        :string(255)
#  tags       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PathwaySetting < ApplicationRecord
#  attr_accessible :program, :program_id, :url, :tags

  belongs_to :program

  delegate :name, to: :program, prefix: true

  TAGS = [
    ['You would like working with other people', 'peopleperson'],
    ['You would like working with technology', 'tecky'],
    ['You would not be bothered by blood and body fluids', 'blood'],
    ['You would be able to make life or death decisions', 'lifeordeath'],
    ['You would rather take direction in your job', 'takedirection'],
    ['You would love to have hands-on work', 'handson'],
    ['You would prefer to work by yourself', 'loner']
  ]
end

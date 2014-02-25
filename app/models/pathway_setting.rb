class PathwaySetting < ActiveRecord::Base
  attr_accessible :program, :program_id, :url, :tags
  
  belongs_to :program
  
  delegate :name, to: :program, prefix: true
end
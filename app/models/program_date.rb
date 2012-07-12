class ProgramDate < ActiveRecord::Base
  
  attr_accessible :program, :occurs_on

  has_many :sessions
  has_many :students, through: :sessions

end

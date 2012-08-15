# == Schema Information
#
# Table name: program_dates
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  occurs_on  :date
#  program    :string(255)
#  updated_at :datetime         not null
#

class ProgramDate < ActiveRecord::Base
  
  attr_accessible :program, :occurs_on

  has_many :sessions
  has_many :candidates, through: :sessions, source: :user
  
  default_scope order('occurs_on ASC')
  
  def name
    program + " " + occurs_on.to_formatted_s(:pretty)
  end

end

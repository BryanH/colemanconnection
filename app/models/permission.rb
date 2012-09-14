# == Schema Information
#
# Table name: permissions
#
#  action        :string(255)
#  created_at    :datetime
#  id            :integer          not null, primary key
#  subject_class :string(255)
#  updated_at    :datetime
#  user_id       :integer
#

class Permission < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :action, :subject_class, :user_id
  
end

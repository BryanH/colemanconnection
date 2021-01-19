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

class Permission < ApplicationRecord::Base

  belongs_to :user

#  attr_accessible :action, :subject_class, :user_id

#  audit(:create, on: :user) { |permission, user, action| permission.snitches_on(user).for_creating }
#  audit(:destroy, on: :user) { |permission, user, action| permission.snitches_on(user).for_removing }

  def snitches_on(user)
    Snitches::PermissionSnitch.new(self, user)
  end

end

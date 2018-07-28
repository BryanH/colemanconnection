# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(128)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  demographic_id         :integer
#  role_mask              :integer
#  first_name             :string(255)
#  last_name              :string(255)
#  active                 :boolean          default(TRUE)
#  type                   :string(255)
#  username               :string(255)
#  program_affiliations   :text
#

# Deprecated!!!
# This class is no longer used. Please use Employee instead

class Staff < User
  
  scope :active, lambda { |isactive| where(active: isactive) }
  scope :search, lambda { |query| where{first_name.matches("%#{query}%") | 
                                        last_name.matches("%#{query}%") |
                                        email.matches("%#{query}%") }}
  
  def activate!
    self.active = true
    save!
  end
  
  def deactivate!
    self.active = false
    save!
  end
  
end

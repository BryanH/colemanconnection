# == Schema Information
#
# Table name: demographics
#
#  address               :string(255)
#  age_group             :string(255)
#  city                  :string(255)
#  contact               :boolean          default(FALSE)
#  contact_sources       :integer
#  contact_topics        :integer
#  created_at            :datetime
#  current_hcc_college   :string(255)
#  current_hcc_student   :boolean          default(FALSE)
#  first_program_choice  :string(255)
#  gender                :string(255)
#  hcc_email_address     :string(255)
#  hcc_referral_source   :string(255)
#  hcc_student_id        :string(255)
#  home_phone            :string(255)
#  id                    :integer          not null, primary key
#  mobile_phone          :string(255)
#  other_advisor_college :string(255)
#  preferred_start_date  :string(255)
#  second_program_choice :string(255)
#  state                 :string(255)
#  updated_at            :datetime
#  zip                   :string(9)
#

class Demographic < ActiveRecord::Base
  
  validates :zip, format: { with: /^(\d{5}|\d{9}|\d{5}\-\d{4})$/ },
                  allow_blank: true, allow_nil: true
  
  validates :state, length: { is: 2 },
                    inclusion: { in: UnitedStates.abbreviated_names }
  
  validates :home_phone, :mobile_phone, phone_number: true, 
            allow_nil: true,
            allow_blank: true
  
  validates :hcc_student_id, numericality: true
  
  before_validation :upcase_state
  
private
  
  def upcase_state
    self.state.upcase! if self.state
  end
  
end

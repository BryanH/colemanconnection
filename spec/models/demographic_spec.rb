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

require 'spec_helper'

describe Demographic do
  let(:demographic) { Demographic.new }
  subject { demographic }
  
  it { should respond_to(:address) }
  it { should respond_to(:age_group) }
  it { should respond_to(:city) }
  it { should respond_to(:contact) }
  it { should respond_to(:contact_sources) }
  it { should respond_to(:contact_topics) }
  it { should respond_to(:created_at) }
  it { should respond_to(:current_hcc_college) }
  it { should respond_to(:current_hcc_student) }
  it { should respond_to(:first_program_choice) }
  it { should respond_to(:gender) }
  it { should respond_to(:hcc_email_address) }
  it { should respond_to(:hcc_referral_source) }
  it { should respond_to(:hcc_student_id) }
  it { should respond_to(:home_phone) }
  it { should respond_to(:id) }
  it { should respond_to(:mobile_phone) }
  it { should respond_to(:other_advisor_college) }
  it { should respond_to(:preferred_start_date) }
  it { should respond_to(:second_program_choice) }
  it { should respond_to(:state) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:zip) }
  
  # Zipcode validations
  %w[123 abc 123ab].each do |invalid_zip_code|
    it { should_not allow_value(invalid_zip_code).for(:zip) }
  end
  
  %w[77008 77008-1234 770081234].each do |valid_zip_code|
    it { should allow_value(valid_zip_code).for(:zip) }
  end
  
  it { should allow_value(nil).for(:zip) }
  it { should allow_value('').for(:zip) }
  
  # State validations
  %w[Texas EU JP JA XX United\ States].each do |invalid_state|
    it { should_not allow_value(invalid_state).for(:state) }
  end
  
  %w[TX tx WI wi Wi].each do |valid_state|
    it { should allow_value(valid_state).for(:state) }
  end
  
  # Phone Numbers
  [
    '(800 321-9876',
    '800) 321-9876',
    '321-9876x1234567890234',
    '800-321-9876x',
    '800-321-98761',
    '800-321-9876 x',
    '800-321-9876 xa',
    '800a321-9876',
    '800-321-9876x12345678',
    '800-321-9876 x12345678'
  ].each do |invalid_number|
    it { should_not allow_value(invalid_number).for(:home_phone) }
    it { should_not allow_value(invalid_number).for(:mobile_phone) }
  end

  [
    '3219876',
    '800.321.9876',
    '8003219876',
    '321-9876',
    '800-321-9876',
    '321-9876x12345',
    '800-321-9876x1',
    '800-321-9876x 1',
    '800-321-9876x1234567',
    '800-321-9876 x1',
    '800-321-9876 x 1',
    '800-321-9876 x1234567',
    '(800)-321-9876',
    '(800) 321-9876'
  ].each do |valid_number|
    it { should allow_value(valid_number).for(:home_phone) }
    it { should allow_value(valid_number).for(:mobile_phone) }
  end
  
  it { should allow_value(nil).for(:home_phone) }
  it { should allow_value(nil).for(:mobile_phone) }
  it { should allow_value('').for(:home_phone) }
  it { should allow_value('').for(:mobile_phone) }
  
  # HCC Student ID
  it { should validate_numericality_of(:hcc_student_id) }
  
end

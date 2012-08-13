require 'spec_helper'


describe DemographicPresenter do
  let(:object) { Demographic.new }
  let(:presenter) { DemographicPresenter.new(object, view) }
  subject { presenter }
  
  it { should respond_to(:gender) }
  it { should respond_to(:age_group) }
  it { should respond_to(:address) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:home_phone) }
  it { should respond_to(:mobile_phone) }
  it { should respond_to(:current_hcc_college) }
  it { should respond_to(:hcc_email_address) }
  it { should respond_to(:hcc_referral_source) }
  it { should respond_to(:other_advisor_college) }
  it { should respond_to(:first_program_choice) }
  it { should respond_to(:second_program_choice) }
  it { should respond_to(:preferred_start_date) }
end
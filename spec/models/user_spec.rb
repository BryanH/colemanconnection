# == Schema Information
#
# Table name: users
#
#  active                 :boolean          default(TRUE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  created_at             :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  demographic_id         :integer
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(128)      default(""), not null
#  first_name             :string(255)
#  id                     :integer          not null, primary key
#  last_name              :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role_mask              :integer
#  sign_in_count          :integer          default(0)
#  type                   :string(255)
#  updated_at             :datetime
#

require 'spec_helper'

describe User do
  let(:user) { User.new }
  subject { user }
  
  # User details
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:active) }
  it { should respond_to(:demographic_id) }
  
  it { should have_many(:permissions) }
  it { should have_many(:sessions) }
  it { should belong_to(:demographic) }
  
  # STI
  it { should respond_to(:type) }
  
  # Devise attributes
  it { should respond_to(:confirmation_sent_at) }
  it { should respond_to(:confirmation_token) }
  it { should respond_to(:confirmed_at) }
  it { should respond_to(:current_sign_in_at) }
  it { should respond_to(:current_sign_in_ip) }
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:last_sign_in_at) }
  it { should respond_to(:last_sign_in_ip) }
  it { should respond_to(:remember_created_at) }
  it { should respond_to(:reset_password_sent_at) }
  it { should respond_to(:reset_password_token) }
  it { should respond_to(:sign_in_count) }
  it { should respond_to(:name) }
  it { should respond_to(:username) }
  it { should respond_to(:login) }
  
  # Custom Methods
  it { should respond_to(:name) }
  it { should respond_to(:reversed_name) }
  
  # Misc dates
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  
  # Validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  
  context "email should be unique" do
    before { FactoryGirl.create(:user) }
    it { should validate_uniqueness_of(:email) }
  end
  
  context "username should be unique" do
    before { FactoryGirl.create(:user, username: 'tschmidt') }
    it "should have an error" do
      other_user = FactoryGirl.build(:user, username: 'tschmidt')
      
      expect(other_user).to_not be_valid
      expect(other_user.errors[:username]).to include("has already been taken")
    end
  end
  
  context "username should only accept certain characters" do
    %w(tschmidt t_schmidt t.schmidt tschmidt1 tschmidt1980 tschmidt.1980 terry.schmidt).each do |username|
      let(:user) { FactoryGirl.build(:user) }
      it { should validate_format_of(:username).with(username) }
    end
    
    %w(t.schmi.dt t@schmidt t\ schmidt !tschmidt #tschmidt $tschmidt).each do |username|
      let(:user) { FactoryGirl.build(:user, username: username) }
      it { should validate_format_of(:username).not_with(username) }
    end
  end
  
  %w[user@foo,com user_at_foo.org example.user@foo.].each do |invalid_address|
    it { should_not allow_value(invalid_address).for(:email) }
  end
  
  %w[user@foo.com A_USER@f.b.org frst.lst@foo.jp a+b@baz.com].each do |valid_address|
    it { should allow_value(valid_address).for(:email) }
  end
  
  context "on create" do
    context "type is nil" do
      it "should be a Candidate" do
        new_user = FactoryGirl.create(:user)
        expect(new_user.type).to eq "Candidate"
      end
    end
  end
  
  describe "#name" do
    let(:user) { FactoryGirl.build(:user, first_name: 'Terry', last_name: 'Tester') }
    its(:name) { should == "Terry Tester" }
  end
  
  describe "#reversed_name" do
    let(:user) { FactoryGirl.build(:user, first_name: 'Terry', last_name: 'Tester') }
    its(:reversed_name) { should == 'Tester, Terry' }
  end
  
  context "search for user on password reset" do
    let!(:user) { FactoryGirl.create(:candidate, email: 'Test.Email@fake.web') }
    it "should be case-insensitive" do
      expect(User.send_reset_password_instructions(email: 'Test.Email@fake.web')).to eq user
      expect(User.send_reset_password_instructions(email: 'Test.email@fake.web')).to eq user
      expect(User.send_reset_password_instructions(email: 'test.email@fake.web')).to eq user
    end
  end
end

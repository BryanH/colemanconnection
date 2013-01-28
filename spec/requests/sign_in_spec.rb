require 'spec_helper'

describe "User Sign In" do
  context "as an employee" do
    let(:user) { FactoryGirl.create(:employee) }
    include_examples "successful sign in"
    it_should_behave_like "successful sign in"
  end

  context "as a candidate" do
    let(:user) { FactoryGirl.create(:candidate) }
    include_examples "successful sign in"
    it_should_behave_like "successful sign in"
  end

  let(:user) { FactoryGirl.build(:user) }
  it "should not sign in a user that does not exist" do
    visit new_user_session_path
    submit_sign_in_form
    expect(page).to have_content "Invalid email, username, or password"
  end
end

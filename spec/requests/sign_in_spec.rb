require 'spec_helper'

describe "User Sign In" do
  context "as an employee" do
    let(:user) { FactoryGirl.create(:staff) }
    before { user.confirm! }
    include_examples "successful sign in"
    it_should_behave_like "successful sign in"
  end

  context "as a student" do
    let(:user) { FactoryGirl.create(:student) }
    before { user.confirm! }
    include_examples "successful sign in"
    it_should_behave_like "successful sign in"
  end

  context "unconfirmed user" do
    let(:user) { FactoryGirl.create(:user) }

    it "should not sign in a non-confirmed user" do
      visit new_user_session_path
      submit_sign_in_form
      page.should have_content "You have to confirm your account"
    end
  end

  let(:user) { FactoryGirl.build(:user) }
  it "should not sign in a user that does not exist" do
    visit new_user_session_path
    submit_sign_in_form
    page.should have_content "Invalid email or password"
  end
end

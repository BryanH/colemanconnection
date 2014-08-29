require 'spec_helper'

describe "Moving sessions to another date" do
  # Given I have sessions for a particular date
  # When I click a button to move them
  # And I choose a new date
  # Then those sessions should be moved
  
  context "and both dates are in the future" do
    let!(:user) { FactoryGirl.create(:employee, :overlord) }
    let!(:program_date) { FactoryGirl.create(:program_date) }
    let!(:other_program_date) { FactoryGirl.create(:program_date, program: program_date.program) }
    let!(:program_session) { FactoryGirl.create(:program_session, program_date: program_date) }
    
    before do
      visit new_user_session_path
      submit_sign_in_form
    end
    
    it "moves the sessions to the new date" do
      visit employee_root_path
      click_link 'manage program sessions'
      within "#program_date_#{program_date.id}" do
        click_link 'move attendees'
      end
      choose other_program_date.occurs_on.to_s(:pretty)
      click_button 'Save'
      
      expect(page).to have_content "Attendees have been moved successfully"
      expect(program_date.reload.sessions.count).to be_zero
      expect(other_program_date.reload.sessions.count).to eq(1)
    end
  end
  
  context "subject date is in the past" do
    let!(:user) { FactoryGirl.create(:employee, :overlord) }
    let!(:program_date) { FactoryGirl.create(:program_date, occurs_on: 1.month.ago) }
    let!(:other_program_date) { FactoryGirl.create(:program_date, program: program_date.program) }
    let!(:program_session) { FactoryGirl.create(:program_session, program_date: program_date) }
    
    before do
      visit new_user_session_path
      submit_sign_in_form
    end
    
    it "should not display a link to move sessions" do
      visit employee_root_path
      click_link 'manage program sessions'
      within "#program_date_#{program_date.id}" do
        expect(page).to_not have_content 'move attendees'
      end
    end
  end
end
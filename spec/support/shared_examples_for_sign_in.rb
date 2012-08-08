shared_examples "successful sign in" do
  it "should sign in successfully" do
    visit new_user_session_path
    submit_sign_in_form
    ['/students', '/employee'].should include(page.current_path)
  end
end

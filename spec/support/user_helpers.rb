module UserHelpers
  def submit_sign_in_form
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
end

RSpec.configure do |config|
  config.include UserHelpers
end

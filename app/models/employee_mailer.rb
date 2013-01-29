class EmployeeMailer
  
  def self.send_new_account_email(recipient)
    Notifications.delay.new_account(recipient)
  end
  
end
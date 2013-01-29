require_relative '../../app/models/employee_mailer.rb'

describe EmployeeMailer do
  subject { EmployeeMailer }
  
  it { should respond_to(:send_new_account_email) }
end
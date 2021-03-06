class Notifications < ActionMailer::Base
  
  default from: 'colemanconnection@hccs.edu'
  
  def satisfaction_survey(recipient, program_session, token)
    @recipient ||= recipient
    @program_session ||= program_session
    @token ||= token
    mail to: "#{@recipient.name} <#{@recipient.email}>", subject: "Program Session Survey"
  end
  
  def session_reminder(recipient, program_session)
    @recipient ||= recipient
    @program_session ||= program_session
    mail to: "#{@recipient.name} <#{@recipient.email}>", subject: "Program Session Reminder"
  end
  
  def new_account(recipient)
    @recipient ||= recipient
    mail to: "#{@recipient.name} <#{@recipient.email}>", subject: "Welcome to Coleman Connection"
  end
  
  def missed_session(recipient, program_session)
    @recipient ||= recipient
    @program_session ||= program_session
    mail to: "#{@recipient.name} <#{@recipient.email}>", subject: "We Missed You"
  end
  
if Rails.env.development?
  class Preview < MailView
    
    def satisfaction_survey
      recipient = Employee.first
      program_session = ProgramDate.first
      Notifications.satisfaction_survey(recipient, program_session, 'randomtoken')
    end
    
    def session_reminder
      recipient = Candidate.first
      program = Program.where(name: "Pharmacy Technician").first
      program_session = ProgramDate.where(program_id: program.id).first
      Notifications.session_reminder(recipient, program_session)
    end
    
    def new_account
      recipient = Employee.first
      Notifications.new_account(recipient)
    end
    
    def missed_session
      recipient = Employee.first
      program_session = ProgramDate.first
      Notifications.missed_session(recipient, program_session)
    end
    
  end
end
  
end
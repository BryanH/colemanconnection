class Notifications < ActionMailer::Base
  
  default from: 'colemanconnection@hccs.edu'
  
  def satisfaction_survey(recipient, program_session, token)
    @recipient ||= recipient
    @program_session ||= program_session
    @token ||= token
    mail to: "#{@recipient.name} <#{@recipient.email}>", subject: "Program Session Survey"
  end
  
if Rails.env.development?
  class Preview < MailView
    
    def satisfaction_survey
      recipient = Candidate.first
      program_session = ProgramDate.first
      Notifications.satisfaction_survey(recipient, program_session, 'randomtoken')
    end
    
  end
end
  
end
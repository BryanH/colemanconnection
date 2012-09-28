class Announcements < ActionMailer::Base
  
  default from: 'colemanconnection@hccs.edu'
  
  def new_features(recipient)
    @recipient ||= recipient
    mail :to => "#{@recipient.name} <#{@recipient.email}>"
  end
  
  class Preview < MailView
    
    def new_features
      recipient = Employee.first
      Announcements.new_features(recipient)
    end
    
  end
  
end
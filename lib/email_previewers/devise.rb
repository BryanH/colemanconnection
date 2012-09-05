module EmailPreviewers
  class Devise < ::Devise::Mailer
    class Preview < ::MailView
  
      def reset_password_instructions
        user = FactoryGirl.create(:user)
        mail = ::Devise::Mailer.reset_password_instructions(user)
        user.destroy
        mail
      end
      
    end
  end
end
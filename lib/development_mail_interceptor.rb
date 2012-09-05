# Since we don't want emails going out to real email addresses in development
# we need to incorporate an interceptor.
#
# This will redirect all email to the email address given here.
class DevelopmentMailInterceptor < PremailerRails::Hook
  def self.delivering_email(message)
    message.subject = "[#{message.to}] #{message.subject}"
    message.to = ENV['EMAIL_INTERCEPTOR']
  end
end
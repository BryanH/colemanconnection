if ENV.has_key?("DEVISE_USERNAME")
		username = ENV["DEVISE_USERNAME"] || "info@colemanconnection.com"
		password = ENV["DEVISE_PASSWORD"]
		smtp_url = ENV["DEVISE_SMTP"] || "smtpout.secureserver.net"
else
# commenting out for now, because it is preventing deploy
		# raise "(ERR: 5545) Email not configured - see email.rb"
end

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
		:address              => smtp_url,
		:port                 => 25,
		:domain				  => "colemanconnection.com",
		:user_name            => username,
		:password             => password,
		:authentication       => :login,
		:enable_starttls_auto => true
}

# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
#   :address              => "smtp.gmail.com",
#   :port                 => 587,
#   :domain               => 'baci.lindsaar.net',
#   :user_name            => ENV["DEVISE_USERNAME"],
#   :password             => ENV["DEVISE_PASSWORD"],
#   :authentication       => 'plain',
#   :enable_starttls_auto => true
# }

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.perform_deliveries = true

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

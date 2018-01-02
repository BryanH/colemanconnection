username = 'chump' #ColemanConnection.config.devise_username
password = 'chump' #ColemanConnection.config.devise_password
smtp_url = 'http:' #ColemanConnection.config.devise_smtp

# commenting out for now, because it is preventing deploy
		# raise "(ERR: 5545) Email not configured - see email.rb"


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

#ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

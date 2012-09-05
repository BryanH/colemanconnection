ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address                      => "webmail.hccs.edu",
  :user_name                    => ENV["DEVISE_USERNAME"],
  :password                     => ENV["DEVISE_PASSWORD"],
  :authentication               => :login,
  :enable_starttls_auto         => true
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
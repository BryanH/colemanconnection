if ENV.has_key?("DEVISE_USERNAME")
  username = ENV["DEVISE_USERNAME"]
  password = ENV["DEVISE_PASSWORD"]
else
  if File.exist?('/home/tschmidt/.howdy')
    attrs = YAML.load(File.open('/home/tschmidt/.howdy'))
    username = attrs['username']
    password = attrs['pass']
  end
end

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address                      => "10.100.100.139",
  :user_name                    => username,
  :password                     => password,
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
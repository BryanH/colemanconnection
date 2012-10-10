namespace :notifications do
  desc "Send New Feature Emails"
  task :new_features, roles: :app do
    run "cd #{deploy_to}/current && RAILS_ENV=production bundle exec rake notifications:new_features"
  end
end
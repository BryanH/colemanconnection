set :output, '/home/tschmidt/apps/coleman_connection/shared/log/whenever.log'

job_type :coleman_rake, "cd :path && RAILS_ENV=:environment :bundler exec rake :task --silent :output"

every :tuesday, at: '9:00am' do
  coleman_rake 'notifications:program_session_survey'
end

every :monday, at: '9:00am' do
  coleman_rake 'notifications:session_reminder'
end
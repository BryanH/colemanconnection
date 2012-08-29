namespace :check do
  desc "Make sure local git is in syc with the remote"
  task :revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/#{branch}`
      puts "WARNING: HEAD is not the same as origin/#{branch}"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  
  before "deploy", "check:revision"
  before "deploy:migration", "check:revision"
  before "deploy:cold", "check:revision"
end
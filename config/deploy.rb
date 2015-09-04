require 'bundler/capistrano'

load 'config/deploy/recipes/base'
load 'config/deploy/recipes/nginx'
load 'config/deploy/recipes/unicorn'
load 'config/deploy/recipes/postgresql'
# load 'config/deploy/recipes/nodejs'
load 'config/deploy/recipes/rbenv'
load 'config/deploy/recipes/git_check'
load 'config/deploy/recipes/monit'
load 'config/deploy/recipes/delayed_job'
load 'config/deploy/recipes/notifications'
load 'config/deploy/recipes/whenever'
load 'config/deploy/recipes/fix_permissions.rb'
server 'sy-colcon.hccs.edu', :web, :app, :db, :primary => true

set :user, 'bhanks'
set :application, "coleman_connection"
set :rails_env, 'production' # added for delayed_job
set :deploy_to, "/opt/local/cap/colemanconnection"
set :deploy_via, :remote_cache
set :use_sudo, true

set :scm, :git
set :repository, "https://github.com/BryanH/colemanconnection.git"
set :branch, 'master'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keeps only the last 5 releases


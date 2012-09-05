require 'bundler/capistrano'
require 'delayed/recipes'

load 'config/deploy/recipes/base'
load 'config/deploy/recipes/nginx'
load 'config/deploy/recipes/unicorn'
load 'config/deploy/recipes/postgresql'
# load 'config/deploy/recipes/nodejs'
load 'config/deploy/recipes/rbenv'
load 'config/deploy/recipes/git_check'
load 'config/deploy/recipes/monit'

server 'sy-colcon.hccs.edu', :web, :app, :db, :primary => true

set :user, 'tschmidt'
set :application, "coleman_connection"
set :rails_env, 'production' # added for delayed_job
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository, 'git@github.com:tschmidt/coleman_connection.git'
set :github_user, 'tschmidt'
set :branch, 'master'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keeps only the last 5 releases

# Delayed Job  
# after "deploy:stop",    "delayed_job:stop"  
# after "deploy:start",   "delayed_job:start"  
# after "deploy:restart", "delayed_job:restart" 

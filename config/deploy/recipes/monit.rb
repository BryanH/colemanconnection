namespace :monit do
  desc 'Install Moni'
  task :install do
    yum_install 'monit'
    run_rootsh 'chkconfig monit on'
  end
  after "deploy:install", "monit:install"
  
  desc "Setup all Monit configuration"
  task :setup do
    monit_config "monitrc", "/etc/monit/monitrc"
    nginx
    postgresql
    unicorn
    syntax
    reload
  end
  after "deploy:setup", "monit:setup"
  
  task(:nginx, roles: :web) { monit_config "nginx" }
  task(:postgresql, roles: :db) { monit_config "postgresql" }
  task(:unicorn, roles: :app) { monit_config "unicorn" }
  
  %w[start stop restart syntax reload].each do |cmd|
    desc "Run Monit #{cmd} script"
    task cmd do
      run_rootsh "service monit #{cmd}"
    end
  end
end

def monit_config(name, destination = nil)
  destination ||= "/etc/monit/conf.d/#{name}.conf"
  template "monit/#{name}.erb", "/tmp/monit_#{name}"
  run_rootsh "mv /tmp/monit_#{name} #{destination}"
  run_rootsh "chown root #{destination}"
  run_rootsh "chmod 600 #{destination}"
end
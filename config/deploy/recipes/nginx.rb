namespace :nginx do
  %w[start stop restart].each do |command|
    desc "#{command} nginx"
    task command, roles: :web do
      run_rootsh "service nginx #{command}"
    end
  end
end
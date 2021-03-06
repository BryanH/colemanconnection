rails_env           = ENV['RAILS_ENV'] || 'development'
rails_root          = ENV['RAILS_ROOT'] || File.dirname(File.dirname(__FILE__))
script              = "RAILS_ENV=#{rails_env} && #{rails_root}/script/delayed_job"

puts '', rails_root, rails_env, script, ''

God.watch do |w|
  w.dir             = "#{rails_root}"
  w.name            = "dj-coleman-connection"
  w.group           = "dj"
  w.interval        = 30.seconds
                    
  w.start           = "#{script} start"
  w.restart         = "#{script} restart"
  w.stop            = "#{script} stop"
                    
  w.start_grace     = 20.seconds
  w.restart_grace   = 20.seconds
                    
  w.pid_file        = "#{rails_root}/tmp/pids/delayed_job.pid"
  w.behavior        :clean_pid_file
  
  w.start_if do |start|
    start.condition(:process_running) do |c|
      c.interval    = 30.seconds
      c.running     = false
    end
  end
  
  w.restart_if do |restart|
    restart.condition(:memory_usage) do |c|
      c.above       = 100.megabytes
      c.times       = [3,5] # 3 out of 5 checks
    end
    
    restart.condition(:cpu_usage) do |c|
      c.above       = 80.percent
      c.times       = 5
    end
  end
  
  w.lifecycle do |on|
    on.condition :flapping do |c|
      c.to_state     = [:start, :restart]
      c.times        = 5
      c.within       = 5.minutes
      c.transition   = :unmonitored
      c.retry_in     = 10.minutes
      c.retry_times  = 5
      c.retry_within = 2.hours
    end
  end
end

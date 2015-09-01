Devise::Async.setup do |config|
		config.backend = :delayed_job
		#config.enabled = true # | false
end


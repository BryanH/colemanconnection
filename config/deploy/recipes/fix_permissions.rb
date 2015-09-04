namespace :permissions do
		desc "Fix file permissions so group is 'capdeploy'"
		task :fix do
				run_rootsh "chgrp -R capdeploy #{destination}"
		end

		after "deploy:install", "permissions:fix"
end

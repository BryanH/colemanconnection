namespace :deploy do
		namespace :permissions do
				desc "Fix file permissions so group is 'capdeploy'"
				task :fix do
						run_rootsh "chgrp -R capdeploy #{release_path}"
				end

		end
end

after "deploy:create_symlink", "deploy:permissions:fix"

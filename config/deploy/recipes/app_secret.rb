namespace :config do
		desc "Symlink application config files"
		task :symlink do
				run "ln -s {#{shared_path},#{release_path}}/config/app_secret.yml"
		end
end

after "deploy", "config:symlink"

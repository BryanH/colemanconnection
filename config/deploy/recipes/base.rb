def template(from, to)
  erb = File.read(File.expand_path("../../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

def run_rootsh(command, options={}, &block)
  run "sudo /usr/local/bin/rootsh '#{command}'", options, &block
end

# Install via yum.
# 
# ==== Options
# +packages+:: Packages to install, comma separated list
#  
# ==== Examples
#   yum_install 'monit'
#   yum_install('monit', 'aspell')
#
def yum_install(*packages)  
  run_rootsh "yum -y install #{packages.join(' ')}" unless packages.empty?
end

# Update via yum.
#
# ==== Options
# +packages+:: Packages to update, comma separated list
#
# ==== Examples
#   yum_update 'monit'
#   yum_update 'monit', 'aspell'
#
def yum_update(*packages)
  installed_packages = []
  
  run_rootsh "yum -d 0 list install #{packages.join(' ')}" do |channel, stream, data|
    lines = data.split("\n")[1..1]
    if lines.blank?
      logger.info "Invalid yum output: #{data}"
    else
      installed_packages += lines.collect { |line| line.split('.').first }
    end
  end
  
  run_rootsh "yum -y update #{installed_packages.join(' ')}" unless installed_packages.empty?
end
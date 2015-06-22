#
# Cookbook Name:: mongodb
# Recipe:: mongodb_org_3_repo
#

# Sets up the repositories for stable mongodb-org packages found here:
# http://www.mongodb.org/downloads#packages
node.override['mongodb']['package_name'] = 'mongodb-org'

case node['platform_family']
  when 'debian'
    if node['platform'] == 'ubuntu'
      apt_repository 'mongodb-org-3.0' do
        #code_name = `lsb_release -c`.strip
        uri 'http://repo.mongodb.org/apt/ubuntu'
        distribution "trusty/mongodb-org/3.0"
        components ['multiverse']
        keyserver 'hkp://keyserver.ubuntu.com:80'
        key '7F0CEB10'
        action :add
      end
    end
  else
    # build from source
    Chef::Log.warn("Adding the #{node['platform_family']} mongodb-org-3 repository is not yet not supported by this cookbook")
end
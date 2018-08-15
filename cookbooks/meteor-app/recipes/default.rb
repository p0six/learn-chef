#
# Cookbook:: meteor-app
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

directory '/home/vagrant/dev' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

execute 'installs meteor' do
  command '/usr/bin/curl https://install.meteor.com/ | sh'
  user 'vagrant'
  cwd '/home/vagrant/dev'
  environment ({"HOME" => "/home/vagrant"})
  not_if { ::File.exist?('/usr/local/bin/meteor') }
  live_stream true
  action :run
end

execute 'creates meteor app' do
  command '/usr/local/bin/meteor create my_first_app'
  environment ({"HOME" => "/home/vagrant"})
  user 'vagrant' 
  cwd '/home/vagrant/dev'
  not_if { ::File.exist?('/home/vagrant/dev/my_first_app') }
  live_stream true
  action :run
end

execute 'my_first_app' do
  command '/usr/bin/nohup /usr/local/bin/meteor < /dev/null > /tmp/nohup.out 2>&1 &'
  environment ({"HOME" => "/home/vagrant"})
  user 'vagrant' 
  cwd '/home/vagrant/dev/my_first_app'
  not_if '/usr/bin/netstat -na | /usr/bin/grep -i listen | /usr/bin/grep "0.0.0.0:3000"'
  live_stream true
  action :run
end

include_recipe 'build-essential'
include_recipe 'mysql::client'
include_recipe 'git'

package 'libtool'
package 'pkg-config'
package 'libboost-all-dev'
package 'ragel'

package 'libpq-dev'

git '/usr/src/powerdns' do
  repository 'https://github.com/PowerDNS/powerdns.git'
  reference node[:powerdns][:source][:reference]
  action :sync
end

path = '/usr/src/powerdns'

user 'powerdns'
group 'powerdns'

execute 'powerdns: bootstrap' do
  command './bootstrap'
  cwd path
  creates '/usr/src/powerdns/configure'
end

execute 'powerdns: configure' do
  command './configure ' +
    "--with-modules='#{node[:powerdns][:source][:backends]}' " +
    '--with-mysql-includes=/usr/include ' +
    '--without-lua'
  cwd path
  creates '/usr/src/powerdns/config.h'
end

execute 'powerdns: build' do
  command 'make'
  cwd path
  creates '/usr/src/powerdns/powerdns/powerdns_server'
end

execute 'powerdns: install' do
  command 'make install'
  cwd path
  creates '/usr/local/sbin/powerdns_server'
end

file '/usr/src/powerdns/powerdns/powerdns' do
  owner 'root'
  group 'root'
  mode '0755'
end

execute 'copy powerdns init' do
  command 'cp /usr/src/powerdns/powerdns/powerdns /etc/init.d/powerdns'
  not_if 'diff /usr/src/powerdns/powerdns/powerdns /etc/init.d/powerdns'
end

file '/etc/init.d/powerdns' do
  owner 'root'
  group 'root'
  mode '0755'
end

directory '/etc/powerdns' do
  owner 'powerdns'
  group 'powerdns'
  mode '0755'
end

link '/usr/local/etc/powerdns.conf' do
  to '/etc/powerdns/powerdns.conf'
end

template '/etc/powerdns/powerdns.conf' do
  source 'powerdns.conf.erb'
  owner 'powerdns'
  group 'powerdns'
  mode '0644'
  notifies :restart, 'service[powerdns]', :immediately
end

service 'powerdns' do
  action [ :enable, :start ]
end

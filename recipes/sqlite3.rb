#
# Cookbook Name:: powerdns
# Recipe:: sqlite3
#
# Copyright 2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "sqlite"

package "libsqlite3-dev" do
  action :nothing
end.run_action(:install)

chef_gem 'sqlite3'

package "powerdns-backend-sqlite3" do
  package_name value_for_platform(
    "arch" => { "default" => "powerdns" },
    ["debian","ubuntu"] => { "default" => "powerdns-backend-sqlite3" },
    ["redhat","centos","fedora"] => { "default" => "powerdns-backend-sqlite3" },
    "default" => "powerdns-backend-sqlite3"
  )
end

directory "/var/lib/powerdns"

cookbook_file "/var/tmp/powerdns_schema.sql" do
  source "schema.sql"
end

ruby_block "load powerdns schema" do
  block do
    require 'sqlite3'
    SQLite3::Database.new("/var/lib/powerdns/powerdns.sqlite3") do |db|
      db.execute_batch(IO.read("/var/tmp/powerdns_schema.sql"))
    end
  end
end

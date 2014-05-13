#
# Cookbook Name:: powerdns
# Recipe:: mariadb
#
# Copyright 2014, Ooyala, Inc.
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

include_recipe "mariadb::client"
include_recipe "mariadb::ruby"

#package "powerdns-backend-mysql" do
#  package_name value_for_platform(
#    "arch" => { "default" => "powerdns" },
#    ["debian","ubuntu"] => { "default" => "powerdns-backend-mysql" },
#    ["redhat","centos","fedora"] => { "default" => "powerdns-backend-mysql" },
#    "default" => "powerdns-backend-mysql"
#  )
#end

template "/tmp/powerdns.schema.sql" do
  source "mariadb.schema.sql"
end

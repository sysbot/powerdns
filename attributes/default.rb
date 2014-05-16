#
# Cookbook Name:: powerdns
# Attributes:: default
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

default["powerdns"]["user"] = "pdns"
default["powerdns"]["group"] = "pdns"

case node['platform_family']
when "rhel","fedora"
  default["powerdns"]["server"]["config_dir"] = "/etc/powerdns"
  default["powerdns"]["recursor"]["config_dir"] = "/etc/powerdns-recursor"
  default["powerdns"]["user"] = "powerdns-recursor"
  default["powerdns"]["group"] = "powerdns-recursor"
else
  default["powerdns"]["server"]["config_dir"] = "/etc/powerdns"
  default["powerdns"]["recursor"]["config_dir"] = "/etc/powerdns"
end

default["powerdns"]["server_backend"] = "sqlite"

default["powerdns"]["recursor"]["allow_from"] = [
  "127.0.0.0/8",
  "10.0.0.0/8",
  "192.168.0.0/16",
  "172.16.0.0/12",
  "::1/128",
  "e80::/10"
]

default["powerdns"]["recursor"]["auth_zones"] = []
default["powerdns"]["recursor"]["forward_zones"] = []
default["powerdns"]["recursor"]["forward_zones_recurse"] = []
default["powerdns"]["recursor"]["local_address"] = [ipaddress]
default["powerdns"]["recursor"]["local_port"] = "53"

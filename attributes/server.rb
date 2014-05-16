default["powerdns"]["server_config_version"] = 3

if node["powerdns"]["server_config_version"] == 2
  default["powerdns"]["server"]["allow_recursion_override"] = 'off'
  default["powerdns"]["server"]["lazy_recursion"] = true
  default["powerdns"]["server"]["logfile"] = 'powerdns.log'
  default["powerdns"]["server"]["skip_cname"] = false
  default["powerdns"]["server"]["use_logfile"] = false
  default["powerdns"]["server"]["wildcards"] = nil
else
  default["powerdns"]["server"]["edns_subnet_option_number"] = 20730
  default["powerdns"]["server"]["edns_subnet_processing"] = false
  default["powerdns"]["server"]["entropy_source"] = '/dev/urandom'
  default["powerdns"]["server"]["experimental_direct_dnskey"] = false
  default["powerdns"]["server"]["experimental_json_interface"] = false
  default["powerdns"]["server"]["experimental_logfile"] = '/var/log/powerdns.log'
  default["powerdns"]["server"]["log_dns_queries"] = false
  default["powerdns"]["server"]["lua_prequery_script"] = nil
  default["powerdns"]["server"]["max_cache_entries"] = 1000000
  default["powerdns"]["server"]["max_ent_entries"] = 100000
  default["powerdns"]["server"]["overload_queue_length"] = 0
  default["powerdns"]["server"]["query_local_address6"] = '::'
  default["powerdns"]["server"]["receiver_threads"] = 1
  default["powerdns"]["server"]["retrieval_threads"] = 2
  default["powerdns"]["server"]["server_id"] = nil
  default["powerdns"]["server"]["signing_threads"] = 3
  default["powerdns"]["server"]["slave_renotify"] = false
  default["powerdns"]["server"]["tcp_control_address"] = nil
  default["powerdns"]["server"]["tcp_control_port"] = 53000
  default["powerdns"]["server"]["tcp_control_range"] = [ '127.0.0.0/8',
                                                  '10.0.0.0/8',
                                                  '192.168.0.0/16',
                                                  '172.16.0.0/12',
                                                  '::1/128',
                                                  'fe80::/10' ]
  default["powerdns"]["server"]["tcp_control_secret"] = nil
  default["powerdns"]["server"]["traceback_handler"] = true
end

default["powerdns"]["server"]["allow_axfr_ips"] = [ '0.0.0.0/0',
                                             '::/0' ]
default["powerdns"]["server"]["allow_recursion"] = [ '127.0.0.1' ]
default["powerdns"]["server"]["cache_ttl"] = 20
default["powerdns"]["server"]["chroot"] = nil
default["powerdns"]["server"]["config_dir"] = '/etc/powerdns'
default["powerdns"]["server"]["config_name"] = nil
default["powerdns"]["server"]["control_console"] = false
default["powerdns"]["server"]["daemon"] = true
default["powerdns"]["server"]["default_soa_name"] = nil
default["powerdns"]["server"]["default_ttl"] = 3600
default["powerdns"]["server"]["disable_axfr"] = true
default["powerdns"]["server"]["disable_tcp"] = false
default["powerdns"]["server"]["distributor_threads"] = 3
default["powerdns"]["server"]["do_ipv6_additional_processing"] = true
default["powerdns"]["server"]["fancy_records"] = false
default["powerdns"]["server"]["gmysql_host"] = nil
default["powerdns"]["server"]["gmysql_user"] = nil
default["powerdns"]["server"]["gmysql_password"] = nil
default["powerdns"]["server"]["gmysql_dbname"] = nil
default["powerdns"]["server"]["guardian"] = true
default["powerdns"]["server"]["launch"] = nil
default["powerdns"]["server"]["load_modules"] = nil
default["powerdns"]["server"]["local_address"] = node["ipaddress"]
default["powerdns"]["server"]["local_ipv6"] = nil
default["powerdns"]["server"]["local_port"] = 53
default["powerdns"]["server"]["log_dns_details"] = false
default["powerdns"]["server"]["log_failed_updates"] = false
default["powerdns"]["server"]["logging_facility"] = nil
default["powerdns"]["server"]["loglevel"] = 4
default["powerdns"]["server"]["master"] = 'off'
default["powerdns"]["server"]["max_queue_length"] = 5000
default["powerdns"]["server"]["max_tcp_connections"] = 10
default["powerdns"]["server"]["module_dir"] = '/usr/lib/powerdns'
default["powerdns"]["server"]["negquery_cache_ttl"] = 60
default["powerdns"]["server"]["no_shuffle"] = false
default["powerdns"]["server"]["out_of_zone_additional_processing"] = true
default["powerdns"]["server"]["pipebackend_abi_version"] = 1
default["powerdns"]["server"]["pipe_command"] = nil
default["powerdns"]["server"]["query_cache_ttl"] = 20
default["powerdns"]["server"]["query_local_address"] = '0.0.0.0'
default["powerdns"]["server"]["query_logging"] = false
default["powerdns"]["server"]["queue_limit"] = 1500
default["powerdns"]["server"]["recursive_cache_ttl"] = 10
default["powerdns"]["server"]["recursor"] = false
default["powerdns"]["server"]["send_root_referral"] = false
default["powerdns"]["server"]["setgid"] = 'powerdns'
default["powerdns"]["server"]["setuid"] = 'powerdns'
default["powerdns"]["server"]["slave"] = 'off'
default["powerdns"]["server"]["slave_cycle_interval"] = 60
default["powerdns"]["server"]["smtpredirector"] = nil
default["powerdns"]["server"]["soa_expire_default"] = 604800
default["powerdns"]["server"]["soa_minimum_ttl"] = 3600
default["powerdns"]["server"]["soa_refresh_default"] = 10800
default["powerdns"]["server"]["soa_retry_default"] = 3600
default["powerdns"]["server"]["soa_serial_offset"] = 0
default["powerdns"]["server"]["socket_dir"] = '/var/run'

# obsolted parameter
#default["powerdns"]["server"]["strict_rfc_axfrs"] = false
#
default["powerdns"]["server"]["trusted_notification_proxy"] = nil
default["powerdns"]["server"]["urlredirector"] = '127.0.0.1'
default["powerdns"]["server"]["version_string"] = 'powerdns'
default["powerdns"]["server"]["webserver"] = false
default["powerdns"]["server"]["webserver_address"] = '127.0.0.1'
default["powerdns"]["server"]["webserver_password"] = nil
default["powerdns"]["server"]["webserver_port"] = 8081
default["powerdns"]["server"]["webserver_print_arguments"] = false
default["powerdns"]["server"]["wildcard_url"] = false

solodir = "#{ENV['HOME']}"

log_level :debug
log_location "#{solodir}/solo.log"
verbose_logging true
file_backup_path "/tmp/cache"
file_cache_path "/tmp/cache"
pid_file "/var/run/client.pid"
cache_type 'BasicFile'
cache_options(:path => "#{solodir}/checksums")
cookbook_path ["#{solodir}/developer_workstation/chef-solo/cookbooks"]
role_path "#{solodir}/developer_workstation/chef-solo/roles"
json_attribs "#{solodir}/developer_workstation/chef-solo/node.json"

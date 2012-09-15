dmg_package node['dw']['clitools']['volumes_dir'] do
  dmg_name	node['dw']['clitools']['app_name']
#  package_id	node['dw']['clitools']['package_id']
#  volumes_dir	node['dw']['clitools']['volumes_dir']
  source	node['dw']['clitools']['source']
  type "mpkg"	
  action :install
end


#remote_file "#{Chef::Config[:file_cache_path]}/#{node['dw']['clitools']['app_name']}" do
#  source node['dw']['clitools']['source']
#end
  
#package "command_line_tools_for_xcode_os_x_lion_aug_2012.dmg" do
#  action :install
#source "#{Chef::Config[:file_cache_path]}/#{node['dw']['clitools']['app_name']}"
# provider Chef::Provider::Package::Homebrew
#end

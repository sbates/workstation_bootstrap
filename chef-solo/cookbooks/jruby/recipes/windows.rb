# Build the jruby url from attributes
url = "#{node[:jruby][:url_base]}/#{node[:jruby][:version]}/#{node[:jruby][:exe_file]}"
Chef::Log.debug("inspecting JRuby url: #{url.inspect}")

windows_package "JRuby #{node[:jruby][:version]}" do
  action :install
  source url
  installer_type :custom
    options "-q"
  end

jruby_bin_path = "c:/jruby-#{node[:jruby][:version]}/bin"
jruby_java_path = "c:/jruby-#{node[:jruby][:version]}/jre/bin"
[jruby_bin_path, jruby_java_path].each do |path|
  windows_path path do
    action :add
  end
end
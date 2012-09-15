default['firefox']['version'] = "15.0.1"
default['firefox']['base_url'] = "http://mozilla.cdn.leaseweb.com/firefox/releases"
default['firefox']['lang'] = "en-US"

case node.platform_family
  when "windows"
    default['firefox']['plat'] = "win32"
    default['firefox']['type'] = "exe"
  when "mac_os_x"
    default['firefox']['plat'] = "mac"
    default['firefox']['type'] = "dmg"
end

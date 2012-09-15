url = "#{node.firefox.base_url}/#{node.firefox.version}/#{node.firefox.plat}/#{node.firefox.lang}/Firefox%20Setup%20#{node.firefox.version}.#{node.firefox.type}" 

case node.platform
  when "windows"
    windows_package "Mozilla Firefox #{node.firefox.version} (x86 #{node['firefox']['lang']})" do
        source url
        installer_type :custom
        options "-ms"
    end
  when "mac_os_x"
    dmg_package "Firefox" do
      source url
    end
end

unless File.exists?("/Applications/SizeUp.app")

  remote_file "#{Chef::Config[:file_cache_path]}/sizeup.zip" do
    source node["sizeup_download_uri"]
    mode "0644"
  end

  # May not work if System Preferences is open while this is running
  file "/private/var/db/.AccessibilityAPIEnabled" do
    action :create_if_missing
    content "a"
    mode "0444"
  end

  # start up on login
  execute "Start SizeUp automatically" do
    command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/SizeUp.app\"; \"Hide\" = 0; }'"
    user node["current_user"]
  end

  execute "unzip sizeup" do
    command "unzip #{Chef::Config[:file_cache_path]}/sizeup.zip SizeUp.app/* -d /Applications/"
    user node["current_user"]
    group "admin"
  end
end

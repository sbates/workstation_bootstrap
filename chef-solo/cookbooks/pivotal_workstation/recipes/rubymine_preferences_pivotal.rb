rubymine_version  = "#{node['rubymine']['major']}#{node['rubymine']['minor']}"
rubymine_preferences_dir = "#{WS_HOME}/Library/Preferences/RubyMine#{rubymine_version}"
preferences_git_repo_location =  "#{Chef::Config[:file_cache_path]}/Pivotal-Preferences-RubyMine"

git preferences_git_repo_location do
  repository "https://github.com/pivotal/Pivotal-Preferences-RubyMine.git"
  revision node['rubymine']['pivotal_preferences_hash']
  #destination preferences_git_repo_location
  action :sync
  user node["current_user"]
end

[
    [rubymine_preferences_dir, "keymaps"],
    [rubymine_preferences_dir, "templates"],
].each do |dirs|
  recursive_directories dirs do
    owner node["current_user"]
    mode "0755"
    recursive true
  end
end


["keymaps/pivotal.xml", "templates/jasmine.xml"].each do |file|
  link "#{rubymine_preferences_dir}/#{file}" do
    to "#{preferences_git_repo_location}/#{file}"
  end
end

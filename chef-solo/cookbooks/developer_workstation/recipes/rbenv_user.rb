workstation_user = {
    "user" => node['current_user']
}

node['rbenv']['user_installs'] << workstation_user

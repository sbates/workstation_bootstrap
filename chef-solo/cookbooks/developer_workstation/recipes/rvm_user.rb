workstation_user = {
    "user" => node['current_user']
}

node['rvm']['user_installs'] << workstation_user

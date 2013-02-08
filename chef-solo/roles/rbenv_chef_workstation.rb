name File.basename(__FILE__, ".rb")
description "a role containing base build requirements for an rbenv-chef workstation"
run_list "developer_workstation::prep", "build-essential", "git", "homebrew", "ruby_build", "developer_workstation::rbenv_user", "rbenv::user"

override_attributes "rbenv" => {
    "user_gems" => {
            'ruby-1.9.3-p327' => [ { 'name' => 'chef' }]
              }
}

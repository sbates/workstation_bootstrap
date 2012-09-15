name File.basename(__FILE__, ".rb")
description "a role containing base build requirements for all dev workstations"
case ENV['windir']
  when nil
    # mac
    run_list  "developer_workstation::prep", 
              "build-essential", 
              "git", 
              "homebrew", 
              "developer_workstation::rvm_user", 
              "rvm::user", 
              "1password",
              "ghmac",
              "iterm2"
  else
    # windows
    run_list "util", "developer_workstation::svn_checkout"
end

env_run_lists
default_attributes "developer_workstation" => {
    "svn_checkout" => {
        # "projects" => ["YOUR_PROJECT_1", "YOUR_PROJECT_2"]
    }
}
override_attributes "rvm" => {
    "rvmrc" => {
        'rvm_project_rvmrc_default' => 1,
        'rvm_gemset_create_on_use_flag' => 1,
        'rvm_trust_rvmrcs_flag' => 1,
        'rvm_install_on_use_flag' => 1,
        'rvm_make_flags' => "-j 3"
    },
	"user_gems" => {
  	  'ruby-1.9.3-p194' => [ { 'name' => 'chef' }]
	}
}

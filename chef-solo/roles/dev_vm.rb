name File.basename(__FILE__, ".rb")
description "a role containing base build requirements for all dev workstations"
case ENV['windir']
  when nil
    # mac
    run_list "virtualbox"
    override_attributes "rvm" => { "user_gems" => {
       'ruby-1.9.3-p194' => [ { 'name' => 'vagrant' }]
      }              
    }
  else
    # windows
    run_list "virtualbox","jruby::windows"
end

#raise "sudo to root before running" if ENV['SUDO_USER'].nil?

#node["current_user"] = ENV['SUDO_USER'].strip
WS_HOME = ENV['HOME']
WS_LIBRARY = "#{WS_HOME}/Library"

#raise "should not be root" if node["current_user"]=="root"

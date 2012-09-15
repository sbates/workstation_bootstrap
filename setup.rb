### In order to remain OS agnostic, there's no shebang
### Execute this script like this: ruby -e setup.rb

require 'logger'
log = Logger.new(STDOUT)

@user = ENV['SUDO_USER'] || ENV['USER']
@uid = ENV['SUDO_UID'].to_i
dwdir = "/Users/#{@user}/workstation_bootstrap"
chefdir = "/opt/opscode"

# Account for both windows and osx
if ENV['windir'] # hey it's Windows!
  # We've already got everything we need for windows to kick off chef
  exec("chef-solo -c #{ENV['HOME']}/workstation_bootstrap/chef-solo/solo.rb")
else

#It's OSX 
  #Ensure this script is run with sudo. Otherwise exit with an error.
  unless Process.uid == 0
    raise "You must run this script with sudo. Example: sudo ./setup.sh"
  end

  unless File.directory?(chefdir)
    `curl -L http://www.opscode.com/chef/install.sh > install.sh`
     File.chmod(0755, "#{dwdir}/install.sh")
     `#{dwdir}/install.sh`
   end
  
  ### Update the path with fresh ruby
  ### Ensure the chefdir is owned by the user
  if File.directory?(chefdir)
    path = ENV['PATH']
    ENV['PATH'] = "#{chefdir}:#{path}"
    `chown -R #{@user} #{chefdir}`
    `export PATH=#{chefdir}:$PATH`
  else
    raise "#{chefdir} doesn't exist. This is required to continue."
  end
  def sudoed?
    File.readlines(@sudofile).grep(/#{@user}/).any?
  end

  def localed?
    File.directory?(@brewdir) && File.stat(@brewdir).uid == @uid
  end

  # Homebrew needs /usr/local owned by the user
  @brewdir = "/usr/local"
  [@brewdir, "#{@brewdir}/bin","#{@brewdir}/share"].each do |f|
    Dir.mkdir(f) unless File.directory?(f) #create /usr/local dirs unless they` already exists
    File.chown(@uid, nil, f) # make sure it's owned by the user 
  end

  # Ensure the current user is in the sudoers file
  @sudofile = "/etc/sudoers"
  perms = "#{@user} ALL=(ALL) NOPASSWD: ALL"

  # Unless the user already has a line in the sudoers file
  # Append perms above to the sudoers file
  File.open(@sudofile, 'a+') {|f| f.write(perms) } unless sudoed?
  
  # If everything looks good, kick off chef-solo
  if sudoed? && localed?
    puts "You're now ready to run chef.\n"
    exec("sudo -u #{@user} -i '\/Users\/#{@user}\/workstation_bootstrap\/runchef'")
   else puts "You are not sudoed or localed. Chef can't run"
  end
  ## TODO: Remove user from sudoers
  ## I think we'll remove the user from sudoers after chef sets stuff up
end

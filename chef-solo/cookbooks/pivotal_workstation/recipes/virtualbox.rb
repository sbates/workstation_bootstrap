pivotal_workstation_package "VirtualBox" do
  source "http://download.virtualbox.org/virtualbox/4.1.18/VirtualBox-4.1.18-78361-OSX.dmg"
  checksum "b17465ee88135f9dbb3f4e6eba1bee408f72f2dafebd872c51344cbb474bffde"
  action :install
  type "mpkg"
  package_id "org.virtualbox.pkg.virtualbox"
end

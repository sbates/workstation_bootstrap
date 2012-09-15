# Chef needs to run as root in order for gcc to install correctly
# This results in some rvm files being owned by root instead of the user
# Here we clean up file perms and fix some weirdness with gems

execute "chown -R #{node['current_user']} #{ENV['HOME']}" do
end

#execute "gem pristine --all" do
#  user node['current_user']
#end

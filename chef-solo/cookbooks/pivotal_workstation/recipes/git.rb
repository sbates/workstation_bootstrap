unless system("git --version | grep 'git version' > /dev/null")
  include_recipe "pivotal_workstation::homebrew"

  execute "brew install git" do
    user node["current_user"]
    command "brew install git"
  end
end

# For some reason, the cache directory is not always created appropriately. 
# So we do it here first
directory Chef::Config['file_cache_path'] do
  action :create
end

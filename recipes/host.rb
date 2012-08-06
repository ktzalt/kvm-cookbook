
if node[:virtualization].has_key?("role") and node[:virtualization][:role] == "host" and node[:virtualization][:system] == "kvm"
  include_recipe "kvm::tuning"
  include_recipe "ntp"
end


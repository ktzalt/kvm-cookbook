
if node[:virtualization].has_key?("role") and node[:virtualization][:role] == "guest" and node[:virtualization][:system] == "kvm"
  include_recipe "ntp::disable"

end

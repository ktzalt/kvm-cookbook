include_recipe "kvm::default"

if node[:cpu][0][:flags].include?("ept")
  sysctl "vm.swappiness" do
    value "0"
  end
end


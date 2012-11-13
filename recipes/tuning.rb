include_recipe "kvm::default"

include_recipe "sysctl"

include_recipe "modules"

if node[:cpu]["0"][:flags].include?("ept") and node['kernel']['release'] < "3.5"
  sysctl "vm.swappiness" do
    value "0"
    action :set
  end
end

modules "vhost_net"


include_recipe "sysfs"
#sysfs "Tuning ondemand cpufreq governor" do
#  name "devices/system/cpu/cpufreq/ondemand/sampling_down_factor"
#  value "100"
#end

## Don't change the cpu frequency.
# clock drift (in some cases)
# Drop performances http://lists.gnu.org/archive/html/qemu-devel/2012-03/msg00842.html
node.set["cpu"]["governor"] = "performance"
include_recipe "cpu"

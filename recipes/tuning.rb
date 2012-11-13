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

# Correct problem with dhcpd and vhost_net
# http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Virtualization_Host_Configuration_and_Guest_Installation_Guide/ch11s02.html
# https://bugs.launchpad.net/ubuntu/+source/isc-dhcp/+bug/930962

# suppress because iptables_rules suppress all others rules

#include_recipe "iptables"
#iptables_rule "correctUdpDhcp"


## Don't change the cpu frequency.
# clock drift (in some cases)
# Drop performances http://lists.gnu.org/archive/html/qemu-devel/2012-03/msg00842.html
node.set["cpu"]["governor"] = "performance"
include_recipe "cpu"

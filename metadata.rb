name             "kvm"
maintainer       "Guilhem Lettron"
maintainer_email "guilhem.lettron@youscribe.com"
license          "Apache 2.0"
description      "Installs/Configures/tuning kvm"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.1"

depends          "ntp", ">= 1.2.0"

suggests         "sysctl"
suggests         "modules"
suggests         "sysfs"
suggests         "cpu"

distros = %w(debian ubuntu)

distros.each do |dist|
  supports dist
end

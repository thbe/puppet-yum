# Class: yum::config::centos
#
# This module contain the configuration for yum CentOS repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::centos {
  file { $yum::params::el_centos_file:
    ensure  => file,
    mode    => '0644',
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::el_centos_template);
  }
}

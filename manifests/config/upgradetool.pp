# Class: yum::config::upgradetool
#
# This module contain the configuration for yum upgradetool repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::upgradetool {
  file { $yum::params::el_centos_upg_file:
    ensure  => present,
    mode    => '0644',
    owner   => root,
    group   => root,
    path    => $yum::params::el_centos_upg_file,
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::el_centos_upg_template);
  }
}

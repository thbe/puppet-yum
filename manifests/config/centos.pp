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
  file { $yum::params::elCentosFile:
    ensure  => present,
    mode    => '0644',
    owner   => root,
    group   => root,
    path    => $yum::params::elCentosFile,
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::elCentosTemplate);
  }
}

# Class: yum::config::ovirt
#
# This module contain the configuration for yum ovirt repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::ovirt {
  file { $yum::params::elOvirtFile:
    ensure  => present,
    mode    => '0644',
    owner   => root,
    group   => root,
    path    => $yum::params::elOvirtFile,
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::elOvirtTemplate);
  }
}

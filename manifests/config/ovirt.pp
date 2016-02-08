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
  file { $yum::params::el_ovirt_file:
    ensure  => file,
    mode    => '0644',
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::el_ovirt_template);
  }

  file { $yum::params::el_ovirt_dependencies_file:
    ensure  => file,
    mode    => '0644',
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::el_ovirt_dependencies_template);
  }
}

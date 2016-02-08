# Class: yum::config::epel
#
# This module contain the configuration for yum EPEL repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::epel {
  file { $yum::params::el_epel_file:
    ensure  => file,
    mode    => '0644',
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::el_epel_template);
  }

  file { $yum::params::el_epel_testing_file:
    ensure  => file,
    mode    => '0644',
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::el_epel_testing_template);
  }
}

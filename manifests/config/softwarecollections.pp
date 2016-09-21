# Class: yum::config::softwarecollections
#
# This module contain the configuration for yum Softwarecollections repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::softwarecollections {
  if $::operatingsystem == 'Scientific' {
    file { $yum::params::el_softwarecollections_file:
      ensure  => file,
      mode    => '0644',
      notify  => Exec['yum-cache', 'yum-rpm-key-import'],
      content => template($yum::params::el_softwarecollections_template);
    }
  }

  if $::operatingsystem == 'CentOS' {
    file { $yum::params::el_sclo_file:
      ensure  => file,
      mode    => '0644',
      notify  => Exec['yum-cache', 'yum-rpm-key-import'],
      content => template($yum::params::el_sclo_template);
    }

    file { $yum::params::el_sclo_rh_file:
      ensure  => file,
      mode    => '0644',
      notify  => Exec['yum-cache', 'yum-rpm-key-import'],
      content => template($yum::params::el_sclo_rh_template);
    }
  }
}

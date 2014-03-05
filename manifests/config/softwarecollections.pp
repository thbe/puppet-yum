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
  if $yum::repoSoftwarecollections {
    file {
      $yum::params::el6SoftwarecollectionsFile:
        ensure  => present,
        mode    => '0644',
        owner   => root,
        group   => root,
        path    => $yum::params::el6SoftwarecollectionsFile,
        notify  => Exec['yum-cache'],
        content => template($yum::params::el6SoftwarecollectionsTemplate);
    }
  }
}

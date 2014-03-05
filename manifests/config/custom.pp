# Class: yum::config::custom
#
# This module contain the configuration for yum custom repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::custom {
  if $yum::repoCustom {
    file {
      $yum::params::el6CustomFile:
        ensure  => present,
        mode    => '0644',
        owner   => root,
        group   => root,
        path    => $yum::params::el6CustomFile,
        notify  => Exec['yum-cache'],
        content => template($yum::params::el6CustomTemplate);
    }
  }
}

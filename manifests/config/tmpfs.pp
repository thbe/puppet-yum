# Class: yum::config::tmpfs
#
# This module contain the configuration for tmpfs usage instead of harddrive
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::tmpfs {
  exec { 'moveRepoDirectory':
    command => "mv $yum::params::configYumRepoDirectory $yum::params::configYumRepoDirectory.orig",
    onlyif => "test -d $yum::params::configYumRepoDirectory"
  }

  file { $yum::params::configYumRepoDirectory:
    ensure  => link,
    target  => '/dev/shm',
    require => Exec['moveRepoDirectory']
  }
}

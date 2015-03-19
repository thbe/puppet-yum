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
    path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
    command => "mv $yum::params::configYumRepoDirectory $yum::params::configYumRepoDirectory.orig",
    onlyif  => "test ! -L $yum::params::configYumRepoDirectory"
  }

  file { $yum::params::configYumRepoDirectory:
    ensure  => link,
    target  => '/dev/shm',
    require => Exec['moveRepoDirectory']
  }
}

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
  exec { 'move_repo_directory':
    path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
    command => "mv ${yum::params::config_yum_repo_directory} ${yum::params::config_yum_repo_directory}.orig",
    onlyif  => "test ! -L ${yum::params::config_yum_repo_directory}"
  }

  file { $yum::params::config_yum_repo_directory:
    ensure  => link,
    target  => '/dev/shm',
    require => Exec['move_repo_directory']
  }
}

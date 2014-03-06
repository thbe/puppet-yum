# Class: yum::config::passenger
#
# This module contain the configuration for yum Passenger repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::passenger {
  if $yum::repoPassenger == 'yes' {
    file {
      $yum::params::el6PassengerFile:
        ensure  => present,
        mode    => '0644',
        owner   => root,
        group   => root,
        path    => $yum::params::el6PassengerFile,
        notify  => Exec['yum-cache'],
        content => template($yum::params::el6PassengerTemplate);
    }
  }
}

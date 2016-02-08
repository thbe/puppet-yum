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
  file { $yum::params::el_passenger_file:
    ensure  => file,
    mode    => '0644',
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::el_passenger_template);
  }
}

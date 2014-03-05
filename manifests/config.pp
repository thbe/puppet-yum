# Class: yum::config
#
# This module contain the configuration for yum
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config {

  # yum configuration
  file {
    $yum::params::configYumConf:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      path    => $yum::params::configYumConf,
      content => template($yum::params::configYumConfTemplate);
  }

  # yum repository configuration
  include yum::config::sl
  include yum::config::softwarecollections
  include yum::config::epel
  include yum::config::puppetlabs
  include yum::config::foreman
  include yum::config::passenger
  include yum::config::custom
}

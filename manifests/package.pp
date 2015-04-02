# Class: yum::package
#
# This module contain the packages for yum
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::package {
  package { $yum::params::packageCommon: ensure => installed; }

  package { $yum::params::packageYumDeltarpm: ensure => installed; }

  if $yum::autoUpdate == 'yes' {
    package { $yum::params::packageAutoUpdate: ensure => installed; }
  }
}

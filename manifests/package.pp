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
  package { $yum::params::package_yum: ensure => installed; }

  package { $yum::params::package_yum_deltarpm: ensure => installed; }

  if $yum::auto_update {
    package { $yum::params::package_auto_update: ensure => installed; }
  }
}

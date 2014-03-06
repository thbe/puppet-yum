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

  # manage /etc/yum.repos.d if defined
  if $yum::manage == 'yes' {
    file {
      $yum::params::configYumConfDirectory:
        ensure => directory,
        mode   => '0755',
        owner  => root,
        group  => root,
        purge  => true;
    }
  }

  # Add rpm gpg keys to local pki
  file {
    '/etc/pki/rpm-gpg':
      ensure  => directory,
      mode    => '0755',
      owner   => root,
      group   => root,
      source  => 'puppet:///modules/yum/pki';
  }

  # yum repository configuration
  if $::operatingsystem == 'Scientific' { include yum::config::sl }
  if $::operatingsystem == 'CentOS' { include yum::config::centos }
  include yum::config::softwarecollections
  include yum::config::epel
  include yum::config::puppetlabs
  include yum::config::foreman
  include yum::config::passenger
  include yum::config::custom
}

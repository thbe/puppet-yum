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
  file { $yum::params::configYumConf:
    ensure  => present,
    mode    => '0644',
    owner   => root,
    group   => root,
    path    => $yum::params::configYumConf,
    content => template($yum::params::configYumConfTemplate);
  }

  # manage /etc/yum.repos.d if defined
  if $yum::manage {
    file { $yum::params::configYumConfDirectory:
      ensure => directory,
      mode   => '0755',
      owner  => root,
      group  => root,
      purge  => true;
    }
  }

  # Remove RPM-GPG-KEY-CentOS-Debug-7 placeholder, otherwise rpm import fail
  if $::operatingsystem == 'CentOS' {
    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Debug-7':
      ensure => absent;
    }
  }

  # Add rpm gpg keys to local pki
  file { '/etc/pki/rpm-gpg':
    ensure  => directory,
    recurse => true,
    force   => true,
    owner   => root,
    group   => root,
    notify  => Exec['yum-rpm-key-import'],
    source  => 'puppet:///modules/yum/pki';
  }

  # yum repository configuration
  if $yum::tmpfs {
    include yum::config::tmpfs
  }

  if $::operatingsystem == 'Scientific' {
    include yum::config::sl
  }

  if $::operatingsystem == 'CentOS' {
    include yum::config::centos
  }

  if $yum::repoUpgradetool {
    include yum::config::upgradetool
  }

  if $yum::repoSoftwarecollections {
    include yum::config::softwarecollections
  }

  if $yum::repoEpel {
    include yum::config::epel
  }

  if $yum::repoPuppetlabs {
    include yum::config::puppetlabs
  }

  if $yum::repoForeman {
    include yum::config::foreman
  }

  if $yum::repoPassenger {
    include yum::config::passenger
  }

  if $yum::repoOvirt {
    include yum::config::ovirt
  }

  if $yum::repoIcinga {
    include yum::config::icinga
  }

  if $yum::repoCustom {
    include yum::config::custom
  }
}

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
  file { $yum::params::config_yum_conf:
    ensure  => present,
    mode    => '0644',
    owner   => root,
    group   => root,
    path    => $yum::params::config_yum_conf,
    content => template($yum::params::config_yum_conf_template);
  }

  # manage /etc/yum.repos.d if defined
  if $yum::manage {
    file { $yum::params::config_yum_conf_directory:
      ensure => directory,
      mode   => '0755',
      owner  => root,
      group  => root,
      purge  => true;
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
    source  => 'puppet:///modules/yum/etc/pki/rpm-gpg';
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

  if $::operatingsystemmajrelease == '6' {
    if $yum::repo_upgradetool {
      include yum::config::upgradetool
    }
  }

  if $::operatingsystemmajrelease == '6' {
    if $yum::repo_softwarecollections {
      include yum::config::softwarecollections
    }
  }

  if $yum::repo_epel {
    include yum::config::epel
  }

  if $yum::repo_puppetlabs {
    include yum::config::puppetlabs
  }

  if $yum::repo_foreman {
    include yum::config::foreman
  }

  if $yum::repo_passenger {
    include yum::config::passenger
  }

  if $yum::repo_ovirt {
    include yum::config::ovirt
  }

  if $yum::repo_owncloud {
    include yum::config::owncloud
  }

  if $yum::repo_icinga {
    include yum::config::icinga
  }

  if $yum::repo_custom {
    include yum::config::custom
  }
}

# Class: yum::service
#
# This module contain the service configuration for yum
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::service {
  # yum service configuration
  exec { 'yum-cache':
    command     => 'yum clean all && yum makecache',
    path        => '/bin:/sbin:/usr/bin:/usr/sbin',
    refreshonly => true,
  }

  exec { 'yum-rpm-key-import':
    command     => 'rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-*',
    path        => '/bin:/sbin:/usr/bin:/usr/sbin',
    refreshonly => true,
  }

  if $yum::autoUpdate == 'yes' {
    service {
      $yum::params::serviceAutoUpdate:
      ensure  => 'running',
      enable  => true,
      require => Package[$yum::params::packageAutoUpdate];
    }
  }
}

# Class: yum::config::owncloud
#
# This module contain the configuration for yum Owncloud repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::owncloud {
  file { $yum::params::el_owncloud_file:
    ensure  => file,
    mode    => '0644',
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::el_owncloud_template);
  }
}

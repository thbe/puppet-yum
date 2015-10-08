# Class: yum::config::custom
#
# This module contain the configuration for yum custom repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::custom {
  file { $yum::params::el_custom_file:
    ensure  => present,
    mode    => '0644',
    owner   => root,
    group   => root,
    path    => $yum::params::el_custom_file,
    notify  => Exec['yum-cache', 'yum-rpm-key-import'],
    content => template($yum::params::el_custom_template);
  }
}

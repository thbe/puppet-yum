# Class: yum::config::foreman
#
# This module contain the configuration for yum Foreman repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::foreman {
  file {
    $yum::params::el_foreman_file:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      path    => $yum::params::el_foreman_file,
      notify  => Exec['yum-cache', 'yum-rpm-key-import'],
      content => template($yum::params::el_foreman_template);

    $yum::params::el_foreman_plugins_file:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      path    => $yum::params::el_foreman_plugins_file,
      notify  => Exec['yum-cache', 'yum-rpm-key-import'],
      content => template($yum::params::el_foreman_plugins_template);
  }
}

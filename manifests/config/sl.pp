# Class: yum::config::sl
#
# This module contain the configuration for yum SL and SLx repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::sl {
  file {
    $yum::params::el_sl_file:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      path    => $yum::params::el_sl_file,
      notify  => Exec['yum-cache', 'yum-rpm-key-import'],
      content => template($yum::params::el_sl_template);

    $yum::params::el_slx_file:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      path    => $yum::params::el_slx_file,
      notify  => Exec['yum-cache', 'yum-rpm-key-import'],
      content => template($yum::params::el_slx_template);
  }
}

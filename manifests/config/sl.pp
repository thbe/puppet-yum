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
    $yum::params::elSlFile:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      path    => $yum::params::elSlFile,
      notify  => Exec['yum-cache'],
      content => template($yum::params::elSlTemplate);

    $yum::params::elSlxFile:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      path    => $yum::params::elSlxFile,
      notify  => Exec['yum-cache'],
      content => template($yum::params::elSlxTemplate);
  }
}

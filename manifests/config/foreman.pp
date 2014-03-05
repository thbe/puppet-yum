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
  if $yum::repoForeman {
    file {
      $yum::params::el6ForemanFile:
        ensure  => present,
        mode    => '0644',
        owner   => root,
        group   => root,
        path    => $yum::params::el6ForemanFile,
        notify  => Exec['yum-cache'],
        content => template($yum::params::el6ForemanTemplate);

      $yum::params::el6ForemanPluginsFile:
        ensure  => present,
        mode    => '0644',
        owner   => root,
        group   => root,
        path    => $yum::params::el6ForemanPluginsFile,
        notify  => Exec['yum-cache'],
        content => template($yum::params::el6ForemanPluginTemplate);
    }
  }
}

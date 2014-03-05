# Class: yum::config::epel
#
# This module contain the configuration for yum EPEL repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::epel {
  if $yum::repoEpel {
    file {
      $yum::params::el6EpelFile:
        ensure  => present,
        mode    => '0644',
        owner   => root,
        group   => root,
        path    => $yum::params::el6EpelFile,
        content => template($yum::params::el6EpelTemplate);

      $yum::params::el6EpelTestingFile:
        ensure  => present,
        mode    => '0644',
        owner   => root,
        group   => root,
        path    => $yum::params::el6EpelTestingFile,
        content => template($yum::params::el6EpelTestingTemplate);
    }
  }
}

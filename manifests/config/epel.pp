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
  file {
    $yum::params::elEpelFile:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      path    => $yum::params::elEpelFile,
      notify  => Exec['yum-cache'],
      content => template($yum::params::elEpelTemplate);

    $yum::params::elEpelTestingFile:
      ensure  => present,
      mode    => '0644',
      owner   => root,
      group   => root,
      path    => $yum::params::elEpelTestingFile,
      notify  => Exec['yum-cache'],
      content => template($yum::params::elEpelTestingTemplate);
  }
}

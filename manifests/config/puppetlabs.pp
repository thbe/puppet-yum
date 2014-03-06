# Class: yum::config::puppetlabs
#
# This module contain the configuration for yum Puppetlabs repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::puppetlabs {
  if $yum::repoPuppetlabs == 'yes' {
    file {
      $yum::params::el6PuppetlabsFile:
        ensure  => present,
        mode    => '0644',
        owner   => root,
        group   => root,
        path    => $yum::params::el6PuppetlabsFile,
        notify  => Exec['yum-cache'],
        content => template($yum::params::el6PuppetlabsTemplate);
    }
  }
}

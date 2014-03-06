# == Class: yum
#
# Full description of class yum here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { yum:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Thomas Bendler <project@bendler-net.de>
#
# === Copyright
#
# Copyright 2014 Thomas Bendler, unless otherwise noted.
#
class yum (
  $repoSl                       = false,
  $repoSoftwarecollections      = false,
  $repoEpel                     = false,
  $repoPuppetlabs               = false,
  $repoForeman                  = false,
  $repoPassenger                = false,
  $repoCustom                   = false,
  $el5Sl                        = $yum::params::el5Sl,
  $el5Custom                    = $yum::params::el5Custom,
  $el6Sl                        = $yum::params::el6Sl,
  $el6SlSecurity                = $yum::params::el6SlSecurity,
  $el6SlSource                  = $yum::params::el6SlSource,
  $el6xSl                       = $yum::params::el6xSl,
  $el6xSlSecurity               = $yum::params::el6xSlSecurity,
  $el6xSlFastbugs               = $yum::params::el6xSlFastbugs,
  $el6Softwarecollections       = $yum::params::el6Softwarecollections,
  $el6SoftwarecollectionsSource = $yum::params::el6SoftwarecollectionsSource,
  $el6Epel                      = $yum::params::el6Epel,
  $el6EpelDebuginfo             = $yum::params::el6EpelDebuginfo,
  $el6EpelSource                = $yum::params::el6EpelSource,
  $el6EpelTesting               = $yum::params::el6EpelTesting,
  $el6EpelTestingDebuginfo      = $yum::params::el6EpelTestingDebuginfo,
  $el6EpelTestingSource         = $yum::params::el6EpelTestingSource,
  $el6PuppetlabsProducts        = $yum::params::el6PuppetlabsProducts,
  $el6PuppetlabsProductsSource  = $yum::params::el6PuppetlabsProductsSource,
  $el6PuppetlabsDeps            = $yum::params::el6PuppetlabsDeps,
  $el6PuppetlabsDepsSource      = $yum::params::el6PuppetlabsDepsSource,
  $el6PuppetlabsDevel           = $yum::params::el6PuppetlabsDevel,
  $el6PuppetlabsDevelSource     = $yum::params::el6PuppetlabsDevelSource,
  $el6Foreman                   = $yum::params::el6Foreman,
  $el6ForemanSource             = $yum::params::el6ForemanSource,
  $el6ForemanPlugins            = $yum::params::el6ForemanPlugins,
  $el6ForemanPluginsSource      = $yum::params::el6ForemanPluginsSource,
  $el6Passenger                 = $yum::params::el6Passenger,
  $el6PassengerTesting          = $yum::params::el6PassengerTesting,
  $el6Custom                    = $yum::params::el6Custom
) inherits yum::params {

  # Include Puppetlabs standard library
  include stdlib

  # Containment
  anchor { 'yum::begin': }
  anchor { 'yum::end': }

  # Start workflow
  Anchor['yum::begin']  ->
  Class['yum::package'] ->
  Class['yum::config']  ->
  Class['yum::service']  ->
  Anchor['yum::end']
}

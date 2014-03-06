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
  $manage                       = 'yes',
  $repoSl                       = 'no',
  $repoCentos                   = 'no',
  $repoSoftwarecollections      = 'no',
  $repoEpel                     = 'no',
  $repoPuppetlabs               = 'no',
  $repoForeman                  = 'no',
  $repoPassenger                = 'no',
  $repoCustom                   = 'no',
  $elSl                        = $yum::params::elSl,
  $elSlSecurity                = $yum::params::elSlSecurity,
  $elSlSource                  = $yum::params::elSlSource,
  $elxSl                       = $yum::params::elSlx,
  $elxSlSecurity               = $yum::params::elSlxSecurity,
  $elxSlFastbugs               = $yum::params::elSlxFastbugs,
  $elSoftwarecollections       = $yum::params::elSoftwarecollections,
  $elSoftwarecollectionsSource = $yum::params::elSoftwarecollectionsSource,
  $elEpel                      = $yum::params::elEpel,
  $elEpelDebuginfo             = $yum::params::elEpelDebuginfo,
  $elEpelSource                = $yum::params::elEpelSource,
  $elEpelTesting               = $yum::params::elEpelTesting,
  $elEpelTestingDebuginfo      = $yum::params::elEpelTestingDebuginfo,
  $elEpelTestingSource         = $yum::params::elEpelTestingSource,
  $elPuppetlabsProducts        = $yum::params::elPuppetlabsProducts,
  $elPuppetlabsProductsSource  = $yum::params::elPuppetlabsProductsSource,
  $elPuppetlabsDeps            = $yum::params::elPuppetlabsDeps,
  $elPuppetlabsDepsSource      = $yum::params::elPuppetlabsDepsSource,
  $elPuppetlabsDevel           = $yum::params::elPuppetlabsDevel,
  $elPuppetlabsDevelSource     = $yum::params::elPuppetlabsDevelSource,
  $elForeman                   = $yum::params::elForeman,
  $elForemanSource             = $yum::params::elForemanSource,
  $elForemanPlugins            = $yum::params::elForemanPlugins,
  $elForemanPluginsSource      = $yum::params::elForemanPluginsSource,
  $elPassenger                 = $yum::params::elPassenger,
  $elPassengerTesting          = $yum::params::elPassengerTesting,
  $elCustom                    = $yum::params::elCustom
) inherits yum::params {

  # Include Puppetlabs standard library
  include stdlib

  if $yum::params::linux {
    # Class definitions
    class { 'yum::package': }
    class { 'yum::config': }
    class { 'yum::service': }

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
}

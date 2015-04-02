# == Class: yum
#
# The class yum will take care of basis repositories plus additional
# repositories.
#
# === Parameters
#
# Here is the list of parameters used by this module.
#
# [*manage*]
#   Specify if module should manage yum
#   Default value is true
#
# [*tmpfs*]
#   Specify if yum should use tmpfs instead of harddrive for downloaded RPMs
#   Default value is false
#
# [*autoUpdate*]
#   Specify if yum should use automatic update
#   Default value is false
#
# [*yumExclude*]
#   Specify if yum should not update certain packages
#   Default value is not set
#
# [*yumProxy*]
#   Specify proxy server that yum should use
#   Default value is not set
#
# [*yumProxyUser*]
#   Specify user for proxy server that yum should use
#   Default value is not set
#
# [*yumProxyPassword*]
#   Specify password for proxy server that yum should use
#   Default value is not set
#
# [*repoUpgradetool*]
#   Specify if Upgradetool should be enabled
#   Default value is true if major version 6
#
# [*repoSoftwarecollections*]
#   Specify if Software Collections should be enabled
#   Default value is true if major version 6
#
# [*repoEpel*]
#   Specify if EPEL should be enabled
#   Default value is true
#
# [*repoPuppetlabs*]
#   Specify if Puppetlabs should be enabled
#   Default value is true
#
# [*repoForeman*]
#   Specify if Foreman should be enabled
#   Default value is false
#
# [*repoPassenger*]
#   Specify if Passenger should be enabled
#   Default value is false
#
# [*repoOvirt*]
#   Specify if Ovirt should be enabled
#   Default value is false
#
# [*repoOwncloud*]
#   Specify if Owncloud should be enabled
#   Default value is false
#
# [*repoIcinga*]
#   Specify if Icinga should be enabled
#   Default value is false
#
# [*repoCustom*]
#   Specify if Custom should be enabled
#   Default value is false
#
# === Variables
#
# No additonal variables are required for this module
#
# === Examples
#
#  class { yum:
#    manage      => true,
#    tmpfs       => true,
#    repoForeman => true,
#  }
#
# === Authors
#
# Thomas Bendler <project@bendler-net.de>
#
# === Copyright
#
# Copyright 2015 Thomas Bendler, unless otherwise noted.
#
class yum (
  $manage                      = true,
  $tmpfs                       = false,
  $autoUpdate                  = false,
  $yumExclude                  = 'not set',
  $yumProxy                    = 'not set',
  $yumProxyUser                = 'not set',
  $yumProxyPassword            = 'not set',
  $repoUpgradetool             = true,
  $repoSoftwarecollections     = false,
  $repoEpel                    = true,
  $repoPuppetlabs              = true,
  $repoForeman                 = false,
  $repoPassenger               = false,
  $repoOvirt                   = false,
  $repoOwncloud                = false,
  $repoIcinga                  = false,
  $repoCustom                  = false,
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
  $elIcinga                    = $yum::params::elIcinga,
  $elOwncloud                  = $yum::params::elOwncloud,
  $elCustom                    = $yum::params::elCustom) inherits yum::params {
  # Start workflow
  if $yum::params::linux {
    # Containment
    contain yum::package
    contain yum::config
    contain yum::service

    Class['yum::package'] ->
    Class['yum::config'] ->
    Class['yum::service']
  }
}

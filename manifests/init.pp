# == Class: yum
#
# The class yum will take care of basis repositories plus additional
# repositories.
#
# === Parameters
#
# The yum class has several parameters to control the repositories
# that will be installed. The default configuration install the
# software collections, EPEL and the Puppetlabs repository. Additional
# repositories could be added and activated.
#
# === Variables
#
# === Examples
#
#  class { yum:
#    repoForeman => 'yes',
#  }
#
#  or
#
#  include yum
#  include yum::config::foreman
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
  $manage              = 'yes',
  $repoSoftwarecollections     = 'yes',
  $repoEpel            = 'yes',
  $repoPuppetlabs      = 'yes',
  $repoForeman         = 'no',
  $repoPassenger       = 'no',
  $repoOvirt           = 'no',
  $repoIcinga          = 'no',
  $repoCustom          = 'no',
  $elSl                = $yum::params::elSl,
  $elSlSecurity        = $yum::params::elSlSecurity,
  $elSlSource          = $yum::params::elSlSource,
  $elxSl               = $yum::params::elSlx,
  $elxSlSecurity       = $yum::params::elSlxSecurity,
  $elxSlFastbugs       = $yum::params::elSlxFastbugs,
  $elSoftwarecollections       = $yum::params::elSoftwarecollections,
  $elSoftwarecollectionsSource = $yum::params::elSoftwarecollectionsSource,
  $elEpel              = $yum::params::elEpel,
  $elEpelDebuginfo     = $yum::params::elEpelDebuginfo,
  $elEpelSource        = $yum::params::elEpelSource,
  $elEpelTesting       = $yum::params::elEpelTesting,
  $elEpelTestingDebuginfo      = $yum::params::elEpelTestingDebuginfo,
  $elEpelTestingSource = $yum::params::elEpelTestingSource,
  $elPuppetlabsProducts        = $yum::params::elPuppetlabsProducts,
  $elPuppetlabsProductsSource  = $yum::params::elPuppetlabsProductsSource,
  $elPuppetlabsDeps    = $yum::params::elPuppetlabsDeps,
  $elPuppetlabsDepsSource      = $yum::params::elPuppetlabsDepsSource,
  $elPuppetlabsDevel   = $yum::params::elPuppetlabsDevel,
  $elPuppetlabsDevelSource     = $yum::params::elPuppetlabsDevelSource,
  $elForeman           = $yum::params::elForeman,
  $elForemanSource     = $yum::params::elForemanSource,
  $elForemanPlugins    = $yum::params::elForemanPlugins,
  $elForemanPluginsSource      = $yum::params::elForemanPluginsSource,
  $elPassenger         = $yum::params::elPassenger,
  $elPassengerTesting  = $yum::params::elPassengerTesting,
  $elCustom            = $yum::params::elCustom) inherits yum::params {
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

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
# [*auto_update*]
#   Specify if yum should use automatic update for security updates
#   Default value is false
#
# [*yum_exclude*]
#   Specify if yum should not update certain packages
#   Default value is not set
#
# [*yum_proxy*]
#   Specify proxy server that yum should use
#   Default value is not set
#
# [*yum_proxy_user*]
#   Specify user for proxy server that yum should use
#   Default value is not set
#
# [*yum_proxy_password*]
#   Specify password for proxy server that yum should use
#   Default value is not set
#
# [*repo_upgradetool*]
#   Specify if Upgradetool should be enabled
#   Default value is true if major version 6
#
# [*repo_softwarecollections*]
#   Specify if Software Collections should be enabled
#   Default value is true if major version 6
#
# [*repo_epel*]
#   Specify if EPEL should be enabled
#   Default value is true
#
# [*repo_puppetlabs*]
#   Specify if Puppetlabs should be enabled
#   Default value is true
#
# [*repo_foreman*]
#   Specify if Foreman should be enabled
#   Default value is false
#
# [*repo_passenger*]
#   Specify if Passenger should be enabled
#   Default value is false
#
# [*repo_ovirt*]
#   Specify if Ovirt should be enabled
#   Default value is false
#
# [*repo_owncloud*]
#   Specify if Owncloud should be enabled
#   Default value is false
#
# [*repo_icinga*]
#   Specify if Icinga should be enabled
#   Default value is false
#
# [*repo_custom*]
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
#    manage       => true,
#    tmpfs        => true,
#    repo_foreman => true,
#  }
#
# === Authors
#
# Thomas Bendler <project@bendler-net.de>
#
# === Copyright
#
# Copyright 2016 Thomas Bendler, unless otherwise noted.
#
class yum (
  $manage                         = true,
  $tmpfs                          = false,
  $auto_update                    = false,
  $yum_exclude                    = 'unset',
  $yum_proxy                      = 'unset',
  $yum_proxy_user                 = 'unset',
  $yum_proxy_password             = 'unset',
  $repo_custom                    = false,
  $repo_epel                      = true,
  $repo_foreman                   = false,
  $repo_icinga                    = false,
  $repo_ovirt                     = false,
  $repo_owncloud                  = false,
  $repo_passenger                 = false,
  $repo_puppetlabs                = false,
  $repo_softwarecollections       = false,
  $repo_upgradetool               = false,
  $el_centos_base                 = $yum::params::el_centos_base,
  $el_centos_updates              = $yum::params::el_centos_updates,
  $el_centos_extras               = $yum::params::el_centos_extras,
  $el_centos_plus                 = $yum::params::el_centos_plus,
  $el_centos_contrib              = $yum::params::el_centos_contrib,
  $el_centos_source_base          = $yum::params::el_centos_source_base,
  $el_centos_source_updates       = $yum::params::el_centos_source_updates,
  $el_centos_source_extras        = $yum::params::el_centos_source_extras,
  $el_centos_source_plus          = $yum::params::el_centos_source_plus,
  $el_custom                      = $yum::params::el_custom,
  $el_epel                        = $yum::params::el_epel,
  $el_epel_debuginfo              = $yum::params::el_epel_debuginfo,
  $el_epel_source                 = $yum::params::el_epel_source,
  $el_epel_testing                = $yum::params::el_epel_testing,
  $el_epel_testing_debuginfo      = $yum::params::el_epel_testing_debuginfo,
  $el_epel_testing_source         = $yum::params::el_epel_testing_source,
  $el_foreman                     = $yum::params::el_foreman,
  $el_foreman_source              = $yum::params::el_foreman_source,
  $el_foreman_plugins             = $yum::params::el_foreman_plugins,
  $el_foreman_plugins_source      = $yum::params::el_foreman_plugins_source,
  $el_icinga                      = $yum::params::el_icinga,
  $el_ol7_latest                  = $yum::params::el_ol7_latest,
  $el_ol7_u0_base                 = $yum::params::el_ol7_u0_base,
  $el_ol7_u1_base                 = $yum::params::el_ol7_u1_base,
  $el_ol7_u2_base                 = $yum::params::el_ol7_u2_base,
  $el_ol7_uekr3                   = $yum::params::el_ol7_uekr3,
  $el_ol7_optional_latest         = $yum::params::el_ol7_optional_latest,
  $el_ol7_addons                  = $yum::params::el_ol7_addons,
  $el_ol7_uekr3_ofed20            = $yum::params::el_ol7_uekr3_ofed20,
  $el_ol7_mysql55                 = $yum::params::el_ol7_mysql55,
  $el_ol7_mysql56                 = $yum::params::el_ol7_mysql56,
  $el_ol7_spacewalk22_client      = $yum::params::el_ol7_spacewalk22_client,
  $el_owncloud                    = $yum::params::el_owncloud,
  $el_passenger                   = $yum::params::el_passenger,
  $el_passenger_testing           = $yum::params::el_passenger_testing,
  $el_puppetlabs_pc1              = $yum::params::el_puppetlabs_pc1,
  $el_puppetlabs_pc1_source       = $yum::params::el_puppetlabs_pc1_source,
  $el_sl                          = $yum::params::el_sl,
  $el_sl_security                 = $yum::params::el_sl_security,
  $el_sl_source                   = $yum::params::el_sl_source,
  $el_slx                         = $yum::params::el_slx,
  $el_slx_security                = $yum::params::el_slx_security,
  $el_slx_fastbugs                = $yum::params::el_slx_fastbugs,
  $el_softwarecollections         = $yum::params::el_softwarecollections,
  $el_softwarecollections_source  = $yum::params::el_softwarecollections_source
) inherits yum::params {

  # Validate parameters
  validate_bool($yum::manage)
  validate_bool($yum::tmpfs)
  validate_bool($yum::auto_update)
  validate_string($yum::yum_exclude)
  validate_string($yum::yum_proxy)
  validate_string($yum::yum_proxy_user)
  validate_string($yum::yum_proxy_password)
  validate_bool($yum::repo_custom)
  validate_bool($yum::repo_epel)
  validate_bool($yum::repo_foreman)
  validate_bool($yum::repo_icinga)
  validate_bool($yum::repo_ovirt)
  validate_bool($yum::repo_owncloud)
  validate_bool($yum::repo_passenger)
  validate_bool($yum::repo_puppetlabs)
  validate_bool($yum::repo_softwarecollections)
  validate_bool($yum::repo_upgradetool)
  validate_string($yum::el_centos_base)
  validate_string($yum::el_centos_updates)
  validate_string($yum::el_centos_extras)
  validate_string($yum::el_centos_plus)
  validate_string($yum::el_centos_contrib)
  validate_string($yum::el_centos_source_base)
  validate_string($yum::el_centos_source_updates)
  validate_string($yum::el_centos_source_extras)
  validate_string($yum::el_centos_source_plus)
  validate_string($yum::el_custom)
  validate_string($yum::el_epel)
  validate_string($yum::el_epel_debuginfo)
  validate_string($yum::el_epel_source)
  validate_string($yum::el_epel_testing)
  validate_string($yum::el_epel_testing_debuginfo)
  validate_string($yum::el_epel_testing_source)
  validate_string($yum::el_foreman)
  validate_string($yum::el_foreman_source)
  validate_string($yum::el_foreman_plugins)
  validate_string($yum::el_foreman_plugins_source)
  validate_string($yum::el_icinga)
  validate_string($yum::el_ol7_latest)
  validate_string($yum::el_ol7_u0_base)
  validate_string($yum::el_ol7_u1_base)
  validate_string($yum::el_ol7_u2_base)
  validate_string($yum::el_ol7_uekr3)
  validate_string($yum::el_ol7_optional_latest)
  validate_string($yum::el_ol7_addons)
  validate_string($yum::el_ol7_uekr3_ofed20)
  validate_string($yum::el_ol7_mysql55)
  validate_string($yum::el_ol7_mysql56)
  validate_string($yum::el_ol7_spacewalk22_client)
  validate_string($yum::el_owncloud)
  validate_string($yum::el_passenger)
  validate_string($yum::el_passenger_testing)
  validate_string($yum::el_puppetlabs_pc1)
  validate_string($yum::el_puppetlabs_pc1_source)
  validate_string($yum::el_sl)
  validate_string($yum::el_sl_security)
  validate_string($yum::el_sl_source)
  validate_string($yum::el_slx)
  validate_string($yum::el_slx_security)
  validate_string($yum::el_slx_fastbugs)
  validate_string($yum::el_softwarecollections)
  validate_string($yum::el_softwarecollections_source)

  # Start workflow
  if $yum::params::linux {
    class{'yum::config': } ~>
    class{'yum::install': } ->
    class{'yum::service': } ->
    Class['yum']
  }
  else {
    warning('The current operating system is not supported!')
  }
}

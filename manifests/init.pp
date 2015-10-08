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
#   Specify if yum should use automatic update
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
# Copyright 2015 Thomas Bendler, unless otherwise noted.
#
class yum (
  $manage                         = true,
  $tmpfs                          = false,
  $auto_update                    = false,
  $yum_exclude                    = undef,
  $yum_proxy                      = undef,
  $yum_proxy_user                 = undef,
  $yum_proxy_password             = undef,
  $repo_custom                    = false,
  $repo_epel                      = true,
  $repo_foreman                   = false,
  $repo_icinga                    = false,
  $repo_ovirt                     = false,
  $repo_owncloud                  = false,
  $repo_passenger                 = false,
  $repo_puppetlabs                = true,
  $repo_softwarecollections       = false,
  $repo_upgradetool               = true,
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
  $el_owncloud                    = $yum::params::el_owncloud,
  $el_passenger                   = $yum::params::el_passenger,
  $el_passenger_testing           = $yum::params::el_passenger_testing,
  $el_puppetlabs_products         = $yum::params::el_puppetlabs_products,
  $el_puppetlabs_products_source  = $yum::params::el_puppetlabs_products_source,
  $el_puppetlabs_deps             = $yum::params::el_puppetlabs_deps,
  $el_puppetlabs_deps_source      = $yum::params::el_puppetlabs_deps_source,
  $el_puppetlabs_devel            = $yum::params::el_puppetlabs_devel,
  $el_puppetlabs_devel_source     = $yum::params::el_puppetlabs_devel_source,
  $el_sl                          = $yum::params::el_sl,
  $el_sl_security                 = $yum::params::el_sl_security,
  $el_sl_source                   = $yum::params::el_sl_source,
  $elx_sl                         = $yum::params::elx_sl,
  $elx_sl_security                = $yum::params::elx_sl_security,
  $elx_sl_fastbugs                = $yum::params::elx_sl_fastbugs,
  $el_softwarecollections         = $yum::params::el_softwarecollections,
  $el_softwarecollections_source  = $yum::params::el_softwarecollections_source) inherits yum::params {
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

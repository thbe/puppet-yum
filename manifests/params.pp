# Class: yum::params
#
# This module contain the parameters for yum
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::params {

  # Operating system specific definitions
  case $::osfamily {
    'RedHat' : {
      if $::operatingsystemmajrelease == '7' {
        if $::operatingsystem == 'Scientific' {
          $linux = false
        }
      }

      # Package definition
      $package_yum                = 'yum'
      $package_yum_deltarpm       = 'deltarpm'
      $package_auto_update        = 'yum-cron'

      # Config definition
      $config_yum_conf            = '/etc/yum.conf'
      $config_yum_conf_directory  = '/etc/yum.conf.d'
      $config_yum_conf_template   = 'yum/etc/yum.conf.erb'
      $config_yum_repo_directory  = '/var/lib/yum/repos'
    }
    default: {
      $linux                      = false
    }
  }

  # Yum definitions
  $keepcache                       = '1'

  # Repository definitions
  $el_centos_base                  = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os'
  $el_centos_updates               = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates'
  $el_centos_extras                = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras'
  $el_centos_plus                  = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus'
  $el_centos_contrib               = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib'
  $el_centos_source_base           = 'baseurl=http://vault.centos.org/centos/$releasever/os/Source/'
  $el_centos_source_updates        = 'baseurl=http://vault.centos.org/centos/$releasever/updates/Source/'
  $el_centos_source_extras         = 'baseurl=http://vault.centos.org/centos/$releasever/extras/Source/'
  $el_centos_source_plus           = 'baseurl=http://vault.centos.org/centos/$releasever/centosplus/Source/'
  $el_custom                       = 'baseurl=http://repo.intranet.local/rhel/$releasever/$basearch/'
  $el_epel                         = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch'
  $el_epel_debuginfo               = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch'
  $el_epel_source                  = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-$releasever&arch=$basearch'
  $el_epel_testing                 = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-epel$releasever&arch=$basearch'
  $el_epel_testing_debuginfo       = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel$releasever&arch=$basearch'
  $el_epel_testing_source          = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel$releasever&arch=$basearch'
  $el_icinga                       = 'baseurl=http://packages.icinga.org/epel/$releasever/release/'
  $el_sl_source                    = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/$releasever/SRPMS/'
  if $::operatingsystemmajrelease == '6' {
    $el_sl                           = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-base-6.txt'
    $el_sl_security                  = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-security-6.txt'
    $el_slx                          = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-base-6x.txt'
    $el_slx_security                 = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-security-6x.txt'
    $el_slx_fastbugs                 = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-fastbugs-6x.txt'
    $el_centos_upg                   = 'baseurl=http://dev.centos.org/centos/6/upg/x86_64/'
    $el_softwarecollections          = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/6x/external_products/softwarecollections/$basearch/'
    $el_softwarecollections_source   = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/6x/external_products/softwarecollections/SRPMS/'
    $el_puppetlabs_products          = 'baseurl=http://yum.puppetlabs.com/el/6/products/$basearch/'
    $el_puppetlabs_products_source   = 'baseurl=http://yum.puppetlabs.com/el/6/products/SRPMS/'
    $el_puppetlabs_deps              = 'baseurl=http://yum.puppetlabs.com/el/6/dependencies/$basearch/'
    $el_puppetlabs_deps_source       = 'baseurl=http://yum.puppetlabs.com/el/6/dependencies/SRPMS/'
    $el_puppetlabs_devel             = 'baseurl=http://yum.puppetlabs.com/el/6/devel/$basearch/'
    $el_puppetlabs_devel_source      = 'baseurl=http://yum.puppetlabs.com/el/6/devel/SRPMS/'
    $el_foreman                      = 'baseurl=http://yum.theforeman.org/releases/1.10/el6/$basearch'
    $el_foreman_source               = 'baseurl=http://yum.theforeman.org/releases/1.10/el6/source'
    $el_foreman_plugins              = 'baseurl=http://yum.theforeman.org/plugins/1.10/el6/$basearch'
    $el_foreman_plugins_source       = 'baseurl=http://yum.theforeman.org/plugins/1.10/el6/source'
    $el_passenger                    = 'baseurl=http://passenger.stealthymonkeys.com/rhel/6rolling/$basearch/'
    $el_passenger_testing            = 'baseurl=http://passenger.stealthymonkeys.com/rhel/6rolling/$basearch/testing/'
    $el_owncloud                     = 'baseurl=http://download.opensuse.org/repositories/isv:/ownCloud:/community/CentOS_CentOS-6/'
  }
  if $::operatingsystemmajrelease == '7' {
    $el_centos_debuginfo             = 'baseurl=http://debuginfo.centos.org/7/$basearch/'
    $el_puppetlabs_products          = 'baseurl=http://yum.puppetlabs.com/el/7/products/$basearch/'
    $el_puppetlabs_products_source   = 'baseurl=http://yum.puppetlabs.com/el/7/products/SRPMS/'
    $el_puppetlabs_deps              = 'baseurl=http://yum.puppetlabs.com/el/7/dependencies/$basearch/'
    $el_puppetlabs_deps_source       = 'baseurl=http://yum.puppetlabs.com/el/7/dependencies/SRPMS/'
    $el_puppetlabs_devel             = 'baseurl=http://yum.puppetlabs.com/el/7/devel/$basearch/'
    $el_puppetlabs_devel_source      = 'baseurl=http://yum.puppetlabs.com/el/7/devel/SRPMS/'
    $el_foreman                      = 'baseurl=http://yum.theforeman.org/releases/1.10/el7/$basearch'
    $el_foreman_source               = 'baseurl=http://yum.theforeman.org/releases/1.10/el7/source'
    $el_foreman_plugins              = 'baseurl=http://yum.theforeman.org/plugins/1.10/el7/$basearch'
    $el_foreman_plugins_source       = 'baseurl=http://yum.theforeman.org/plugins/1.10/el7/source'
    $el_owncloud                     = 'baseurl=http://download.opensuse.org/repositories/isv:/ownCloud:/community/CentOS_CentOS-7/'
  }

  # File definitions
  if $::operatingsystemmajrelease == '6' {
    $el_slx_file                     = '/etc/yum.repos.d/sl6x.repo'
    $el_centos_upg_file              = '/etc/yum.repos.d/upgradetool.repo'
  }
  $el_sl_file                      = '/etc/yum.repos.d/sl.repo'
  $el_centos_file                  = '/etc/yum.repos.d/CentOS-Base.repo'
  $el_softwarecollections_file     = '/etc/yum.repos.d/softwarecollections.repo'
  $el_epel_file                    = '/etc/yum.repos.d/epel.repo'
  $el_epel_testing_file            = '/etc/yum.repos.d/epel-testing.repo'
  $el_puppetlabs_file              = '/etc/yum.repos.d/puppetlabs.repo'
  $el_icinga_file                  = '/etc/yum.repos.d/ICINGA-release.repo'
  $el_foreman_file                 = '/etc/yum.repos.d/foreman.repo'
  $el_foreman_plugins_file         = '/etc/yum.repos.d/foreman-plugins.repo'
  $el_passenger_file               = '/etc/yum.repos.d/passenger.repo'
  $el_ovirt_file                   = '/etc/yum.repos.d/ovirt.repo'
  $el_owncloud_file                = '/etc/yum.repos.d/owncloud.repo'
  $el_custom_file                  = '/etc/yum.repos.d/custom.repo'

  # Template definitions
  if $::operatingsystemmajrelease == '6' {
    $el_slx_template                 = 'yum/etc/yum.repos.d/el6/sl6x.repo.erb'
    $el_sl_template                  = 'yum/etc/yum.repos.d/el6/sl.repo.erb'
    $el_centos_template              = 'yum/etc/yum.repos.d/el6/CentOS-Base.repo.erb'
    $el_centos_upg_template          = 'yum/etc/yum.repos.d/el6/upgradetool.repo.erb'
    $el_softwarecollections_template = 'yum/etc/yum.repos.d/el6/softwarecollections.repo.erb'
    $el_epel_template                = 'yum/etc/yum.repos.d/el6/epel.repo.erb'
    $el_epel_testing_template        = 'yum/etc/yum.repos.d/el6/epel-testing.repo.erb'
    $el_puppetlabs_template          = 'yum/etc/yum.repos.d/el6/puppetlabs.repo.erb'
    $el_icinga_template              = 'yum/etc/yum.repos.d/el6/ICINGA-release.repo.erb'
    $el_foreman_template             = 'yum/etc/yum.repos.d/el6/foreman.repo.erb'
    $el_foreman_plugins_template     = 'yum/etc/yum.repos.d/el6/foreman-plugins.repo.erb'
    $el_passenger_template           = 'yum/etc/yum.repos.d/el6/passenger.repo.erb'
    $el_ovirt_template               = 'yum/etc/yum.repos.d/el6/ovirt.repo.erb'
    $el_owncloud_template            = 'yum/etc/yum.repos.d/el6/owncloud.repo.erb'
    $el_custom_template              = 'yum/etc/yum.repos.d/el6/custom.repo.erb'
  }
  if $::operatingsystemmajrelease == '7' {
    $el_centos_template              = 'yum/etc/yum.repos.d/el7/CentOS-Base.repo.erb'
    $el_softwarecollections_template = 'yum/etc/yum.repos.d/el7/softwarecollections.repo.erb'
    $el_epel_template                = 'yum/etc/yum.repos.d/el7/epel.repo.erb'
    $el_epel_testing_template        = 'yum/etc/yum.repos.d/el7/epel-testing.repo.erb'
    $el_puppetlabs_template          = 'yum/etc/yum.repos.d/el7/puppetlabs.repo.erb'
    $el_icinga_template              = 'yum/etc/yum.repos.d/el7/ICINGA-release.repo.erb'
    $el_foreman_template             = 'yum/etc/yum.repos.d/el7/foreman.repo.erb'
    $el_foreman_plugins_template     = 'yum/etc/yum.repos.d/el7/foreman-plugins.repo.erb'
    $el_passenger_template           = 'yum/etc/yum.repos.d/el7/passenger.repo.erb'
    $el_ovirt_template               = 'yum/etc/yum.repos.d/el7/ovirt.repo.erb'
    $el_owncloud_template            = 'yum/etc/yum.repos.d/el7/owncloud.repo.erb'
    $el_custom_template              = 'yum/etc/yum.repos.d/el7/custom.repo.erb'
  }
}

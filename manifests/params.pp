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
      # Check for unsupported operating system versions or operating systems
      if $::operatingsystemmajrelease == '5' {
        $linux = false
      } else {
        if $::operatingsystemmajrelease == '7' and $::operatingsystem == 'Scientific' {
          $linux = false
        } else {
          $linux = true
        }
      }
    }
    default  : {
      $linux = false
    }
  }

  # Package definition
  $package_yum                        = 'yum'
  $package_yum_deltarpm               = 'deltarpm'
  $package_auto_update                = 'yum-cron'

  # Config definition
  $config_yum_conf_directory          = '/etc/yum.conf.d'
  $config_yum_conf                    = '/etc/yum.conf'
  $config_yum_conf_template           = 'yum/etc/yum.conf.erb'
  $config_yum_conf_cron               = '/etc/yum/yum-cron.conf'
  $config_yum_conf_cron_template      = 'yum/etc/yum/yum-cron.conf.erb'
  $config_yum_autoupdate              = '/etc/sysconfig/yum-autoupdate'
  $config_yum_autoupdate_template     = 'yum/etc/sysconfig/yum-autoupdate.erb'
  $config_yum_sysconfig_cron          = '/etc/sysconfig/yum-cron'
  $config_yum_sysconfig_cron_template = 'yum/etc/sysconfig/yum-cron.erb'
  $config_yum_repo_directory          = '/var/lib/yum/repos'

  # Yum definitions
  $keepcache                     = '1'

  # Repository definitions
  case $::operatingsystemmajrelease {
    '6': {
      $el_centos_upg      = 'baseurl=http://dev.centos.org/centos/6/upg/x86_64/'
      $el_epel            = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch'
      $el_epel_debuginfo  = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch'
      $el_epel_source     = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-$releasever&arch=$basearch'
      $el_epel_testing    = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-epel$releasever&arch=$basearch'
      $el_epel_testing_debuginfo     = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel$releasever&arch=$basearch'
      $el_epel_testing_source        = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel$releasever&arch=$basearch'
      $el_foreman         = 'baseurl=http://yum.theforeman.org/releases/1.12/el6/$basearch'
      $el_foreman_source  = 'baseurl=http://yum.theforeman.org/releases/1.12/el6/source'
      $el_foreman_plugins = 'baseurl=http://yum.theforeman.org/plugins/1.12/el6/$basearch'
      $el_foreman_plugins_source     = 'baseurl=http://yum.theforeman.org/plugins/1.12/el6/source'
      $el_owncloud        = 'baseurl=http://download.opensuse.org/repositories/isv:/ownCloud:/community/CentOS_CentOS-6/'
      $el_passenger       = 'baseurl=http://passenger.stealthymonkeys.com/rhel/6rolling/$basearch/'
      $el_passenger_testing          = 'baseurl=http://passenger.stealthymonkeys.com/rhel/6rolling/$basearch/testing/'
      $el_puppetlabs_pc1  = 'baseurl=http://yum.puppetlabs.com/el/6/PC1/$basearch'
      $el_puppetlabs_pc1_source      = 'baseurl=http://yum.puppetlabs.com/el/6/PC1/SRPMS'
      $el_sl              = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-base-6.txt'
      $el_sl_security     = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-security-6.txt'
      $el_slx             = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-base-6x.txt'
      $el_slx_security    = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-security-6x.txt'
      $el_slx_fastbugs    = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-fastbugs-6x.txt'
      $el_softwarecollections        = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/6x/external_products/softwarecollections/$basearch/'
      $el_softwarecollections_source = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/6x/external_products/softwarecollections/SRPMS/'
    }
    '7': {
      $el_centos_debuginfo       = 'baseurl=http://debuginfo.centos.org/7/$basearch/'
      $el_epel                   = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch'
      $el_epel_debuginfo         = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-7&arch=$basearch'
      $el_epel_source            = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-source-7&arch=$basearch'
      $el_epel_testing           = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-epel7&arch=$basearch'
      $el_epel_testing_debuginfo = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel7&arch=$basearch'
      $el_epel_testing_source    = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel7&arch=$basearch'
      $el_foreman                = 'baseurl=http://yum.theforeman.org/releases/1.12/el7/$basearch'
      $el_foreman_source         = 'baseurl=http://yum.theforeman.org/releases/1.12/el7/source'
      $el_foreman_plugins        = 'baseurl=http://yum.theforeman.org/plugins/1.12/el7/$basearch'
      $el_foreman_plugins_source = 'baseurl=http://yum.theforeman.org/plugins/1.12/el7/source'
      $el_ol7_latest             = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/latest/$basearch/'
      $el_ol7_u0_base            = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/0/base/$basearch/'
      $el_ol7_u1_base            = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/1/base/$basearch/'
      $el_ol7_u2_base            = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/2/base/$basearch/'
      $el_ol7_uekr3              = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/UEKR3/$basearch/'
      $el_ol7_optional_latest    = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/optional/latest/$basearch/'
      $el_ol7_addons             = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/addons/$basearch/'
      $el_ol7_uekr3_ofed20       = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/UEKR3_OFED20/$basearch/'
      $el_ol7_mysql55            = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/MySQL55/$basearch/'
      $el_ol7_mysql56            = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/MySQL56/$basearch/'
      $el_ol7_spacewalk22_client = 'http://public-yum.oracle.com/repo/OracleLinux/OL7/spacewalk22/client/$basearch/'
      $el_owncloud               = 'baseurl=http://download.opensuse.org/repositories/isv:/ownCloud:/community/CentOS_CentOS-7/'
      $el_puppetlabs_pc1         = 'baseurl=http://yum.puppetlabs.com/el/7/PC1/$basearch'
      $el_puppetlabs_pc1_source  = 'baseurl=http://yum.puppetlabs.com/el/7/PC1/SRPMS'
    }
    default : {
    }
  }
  $el_centos_base           = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os'
  $el_centos_updates        = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates'
  $el_centos_extras         = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras'
  $el_centos_plus           = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus'
  $el_centos_contrib        = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib'
  $el_centos_source_base    = 'baseurl=http://vault.centos.org/centos/$releasever/os/Source/'
  $el_centos_source_updates = 'baseurl=http://vault.centos.org/centos/$releasever/updates/Source/'
  $el_centos_source_extras  = 'baseurl=http://vault.centos.org/centos/$releasever/extras/Source/'
  $el_centos_source_plus    = 'baseurl=http://vault.centos.org/centos/$releasever/centosplus/Source/'
  $el_custom                = 'baseurl=http://repo.intranet.local/rhel/$releasever/$basearch/'
  $el_icinga                = 'baseurl=http://packages.icinga.org/epel/$releasever/release/'
  $el_sl_source             = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/$releasever/SRPMS/'

  # File definitions
  case $::operatingsystemmajrelease {
    '6': {
      $el_slx_file        = '/etc/yum.repos.d/sl6x.repo'
      $el_centos_upg_file = '/etc/yum.repos.d/upgradetool.repo'
    }
    default : {
    }
  }
  $el_sl_file                  = '/etc/yum.repos.d/sl.repo'
  $el_centos_file              = '/etc/yum.repos.d/CentOS-Base.repo'
  $el_sclo_file                = '/etc/yum.repos.d/CentOS-SCLo-scl.repo'
  $el_sclo_rh_file             = '/etc/yum.repos.d/CentOS-SCLo-scl-rh.repo'
  $el_softwarecollections_file = '/etc/yum.repos.d/softwarecollections.repo'
  $el_epel_file                = '/etc/yum.repos.d/epel.repo'
  $el_epel_testing_file        = '/etc/yum.repos.d/epel-testing.repo'
  $el_oel_file                 = '/etc/yum.repos.d/public-yum-ol7.repo'
  $el_puppetlabs_file          = '/etc/yum.repos.d/puppetlabs-pc1.repo'
  $el_icinga_file              = '/etc/yum.repos.d/ICINGA-release.repo'
  $el_foreman_file             = '/etc/yum.repos.d/foreman.repo'
  $el_foreman_plugins_file     = '/etc/yum.repos.d/foreman-plugins.repo'
  $el_passenger_file           = '/etc/yum.repos.d/passenger.repo'
  $el_ovirt_file               = '/etc/yum.repos.d/ovirt-3.6.repo'
  $el_ovirt_dependencies_file  = '/etc/yum.repos.d/ovirt-3.6-dependencies.repo'
  $el_owncloud_file            = '/etc/yum.repos.d/owncloud.repo'
  $el_custom_file              = '/etc/yum.repos.d/custom.repo'

  # Template definitions
  case $::operatingsystemmajrelease {
    '6': {
      $el_slx_template                 = 'yum/etc/yum.repos.d/el6/sl6x.repo.erb'
      $el_sl_template                  = 'yum/etc/yum.repos.d/el6/sl.repo.erb'
      $el_centos_template              = 'yum/etc/yum.repos.d/el6/CentOS-Base.repo.erb'
      $el_centos_upg_template          = 'yum/etc/yum.repos.d/el6/upgradetool.repo.erb'
      $el_sclo_template                = 'yum/etc/yum.repos.d/el6/CentOS-SCLo-scl.repo.erb'
      $el_sclo_rh_template             = 'yum/etc/yum.repos.d/el6/CentOS-SCLo-scl-rh.repo.erb'
      $el_softwarecollections_template = 'yum/etc/yum.repos.d/el6/softwarecollections.repo.erb'
      $el_epel_template                = 'yum/etc/yum.repos.d/el6/epel.repo.erb'
      $el_epel_testing_template        = 'yum/etc/yum.repos.d/el6/epel-testing.repo.erb'
      $el_puppetlabs_template          = 'yum/etc/yum.repos.d/el6/puppetlabs-pc1.repo.erb'
      $el_icinga_template              = 'yum/etc/yum.repos.d/el6/ICINGA-release.repo.erb'
      $el_foreman_template             = 'yum/etc/yum.repos.d/el6/foreman.repo.erb'
      $el_foreman_plugins_template     = 'yum/etc/yum.repos.d/el6/foreman-plugins.repo.erb'
      $el_passenger_template           = 'yum/etc/yum.repos.d/el6/passenger.repo.erb'
      $el_ovirt_template               = 'yum/etc/yum.repos.d/el6/ovirt-3.6.repo.erb'
      $el_ovirt_dependencies_template  = 'yum/etc/yum.repos.d/el6/ovirt-3.6-dependencies.repo.erb'
      $el_owncloud_template            = 'yum/etc/yum.repos.d/el6/owncloud.repo.erb'
      $el_custom_template              = 'yum/etc/yum.repos.d/el6/custom.repo.erb'
    }
    '7': {
      $el_centos_template              = 'yum/etc/yum.repos.d/el7/CentOS-Base.repo.erb'
      $el_sclo_template                = 'yum/etc/yum.repos.d/el7/CentOS-SCLo-scl.repo.erb'
      $el_sclo_rh_template             = 'yum/etc/yum.repos.d/el7/CentOS-SCLo-scl-rh.repo.erb'
      $el_softwarecollections_template = 'yum/etc/yum.repos.d/el7/softwarecollections.repo.erb'
      $el_epel_template                = 'yum/etc/yum.repos.d/el7/epel.repo.erb'
      $el_epel_testing_template        = 'yum/etc/yum.repos.d/el7/epel-testing.repo.erb'
      $el_oel_template                 = 'yum/etc/yum.repos.d/el7/public-yum-ol7.repo.erb'
      $el_puppetlabs_template          = 'yum/etc/yum.repos.d/el7/puppetlabs-pc1.repo.erb'
      $el_icinga_template              = 'yum/etc/yum.repos.d/el7/ICINGA-release.repo.erb'
      $el_foreman_template             = 'yum/etc/yum.repos.d/el7/foreman.repo.erb'
      $el_foreman_plugins_template     = 'yum/etc/yum.repos.d/el7/foreman-plugins.repo.erb'
      $el_passenger_template           = 'yum/etc/yum.repos.d/el7/passenger.repo.erb'
      $el_ovirt_template               = 'yum/etc/yum.repos.d/el7/ovirt-3.6.repo.erb'
      $el_ovirt_dependencies_template  = 'yum/etc/yum.repos.d/el7/ovirt-3.6-dependencies.repo.erb'
      $el_owncloud_template            = 'yum/etc/yum.repos.d/el7/owncloud.repo.erb'
      $el_custom_template              = 'yum/etc/yum.repos.d/el7/custom.repo.erb'
    }
    default : {
    }
  }

}

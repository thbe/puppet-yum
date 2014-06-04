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
      $linux = true

      # Package definition
      $packageCommon = 'yum'

      # Config definition
      $configYumConf          = '/etc/yum.conf'
      $configYumConfDirectory = '/etc/yum.conf.d'
      $configYumConfTemplate  = 'yum/etc/yum.conf.erb'
    }
    default  : {
      $linux = false
    }
  }

  # Yum definitions
  $keepcache = '1'

  # Repository definitions
  if $::operatingsystemmajrelease == '6' {
    $elSl                          = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-base-6.txt'
    $elSlSecurity                  = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-security-6.txt'
    $elSlx                         = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-base-6x.txt'
    $elSlxSecurity                 = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-security-6x.txt'
    $elSlxFastbugs                 = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-fastbugs-6x.txt'
    $elSoftwarecollections         = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/6x/external_products/softwarecollections/$basearch/'
    $elSoftwarecollectionsSource   = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/6x/external_products/softwarecollections/SRPMS/'
    $elEpelTesting                 = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=$basearch'
    $elEpelTestingDebuginfo        = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel6&arch=$basearch'
    $elEpelTestingSource           = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel6&arch=$basearch'
    $elPuppetlabsProducts          = 'baseurl=http://yum.puppetlabs.com/el/6/products/$basearch/'
    $elPuppetlabsProductsSource    = 'baseurl=http://yum.puppetlabs.com/el/6/products/SRPMS/'
    $elPuppetlabsDeps              = 'baseurl=http://yum.puppetlabs.com/el/6/dependencies/$basearch/'
    $elPuppetlabsDepsSource        = 'baseurl=http://yum.puppetlabs.com/el/6/dependencies/SRPMS/'
    $elPuppetlabsDevel             = 'baseurl=http://yum.puppetlabs.com/el/6/devel/$basearch/'
    $elPuppetlabsDevelSource       = 'baseurl=http://yum.puppetlabs.com/el/6/devel/SRPMS/'
    $elForeman                     = 'baseurl=http://yum.theforeman.org/releases/1.4/el6/$basearch/'
    $elForemanSource               = 'baseurl=http://yum.theforeman.org/releases/1.4/el6/source/'
    $elForemanPlugins              = 'baseurl=http://yum.theforeman.org/plugins/1.4/el6/$basearch/'
    $elForemanPluginsSource        = 'baseurl=http://yum.theforeman.org/plugins/1.4/el6/source/'
    $elPassenger                   = 'baseurl=http://passenger.stealthymonkeys.com/rhel/6rolling/$basearch/'
    $elPassengerTesting            = 'baseurl=http://passenger.stealthymonkeys.com/rhel/6rolling/$basearch/testing/'
  }
  $elCentosBase                  = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os'
  $elCentosUpdates               = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates'
  $elCentosExtras                = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras'
  $elCentosPlus                  = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus'
  $elCentosContrib               = 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib'
  $elSlSource                    = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/$releasever/SRPMS/'
  $elCustom                      = 'baseurl=http://repo.intranet.local/rhel/$releasever/$basearch/'
  $elEpel                        = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch'
  $elEpelDebuginfo               = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch'
  $elEpelSource                  = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-$releasever&arch=$basearch'

  # File definitions
  if $::operatingsystemmajrelease == '6' {
    $elSlxFile                 = '/etc/yum.repos.d/sl6x.repo'
  }
  $elSlFile                  = '/etc/yum.repos.d/sl.repo'
  $elCentosFile              = '/etc/yum.repos.d/CentOS-Base.repo'
  $elSoftwarecollectionsFile = '/etc/yum.repos.d/softwarecollections.repo'
  $elEpelFile                = '/etc/yum.repos.d/epel.repo'
  $elEpelTestingFile         = '/etc/yum.repos.d/epel-testing.repo'
  $elPuppetlabsFile          = '/etc/yum.repos.d/puppetlabs.repo'
  $elForemanFile             = '/etc/yum.repos.d/foreman.repo'
  $elForemanPluginsFile      = '/etc/yum.repos.d/foreman-plugins.repo'
  $elPassengerFile           = '/etc/yum.repos.d/passenger.repo'
  $elOvirtFile               = '/etc/yum.repos.d/ovirt.repo'
  $elCustomFile              = '/etc/yum.repos.d/custom.repo'

  # Template definitions
  if $::operatingsystemmajrelease == '6' {
    $elSlxTemplate                 = 'yum/etc/yum.repos.d/el6/sl6x.repo.erb'
    $elSlTemplate                  = 'yum/etc/yum.repos.d/el6/sl.repo.erb'
    $elCentosTemplate              = 'yum/etc/yum.repos.d/el6/CentOS-Base.repo.erb'
    $elSoftwarecollectionsTemplate = 'yum/etc/yum.repos.d/el6/softwarecollections.repo.erb'
    $elEpelTemplate                = 'yum/etc/yum.repos.d/el6/epel.repo.erb'
    $elEpelTestingTemplate         = 'yum/etc/yum.repos.d/el6/epel-testing.repo.erb'
    $elPuppetlabsTemplate          = 'yum/etc/yum.repos.d/el6/puppetlabs.repo.erb'
    $elForemanTemplate             = 'yum/etc/yum.repos.d/el6/foreman.repo.erb'
    $elForemanPluginTemplate       = 'yum/etc/yum.repos.d/el6/foreman-plugins.repo.erb'
    $elPassengerTemplate           = 'yum/etc/yum.repos.d/el6/passenger.repo.erb'
    $elOvirtTemplate               = 'yum/etc/yum.repos.d/el6/ovirt.repo.erb'
    $elCustomTemplate              = 'yum/etc/yum.repos.d/el6/custom.repo.erb'
  }
}

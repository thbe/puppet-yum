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
      $configYumConf         = '/etc/yum.conf'
      $configYumConfTemplate = 'yum/etc/yum.conf.erb'
    }
    default  : {
      $linux = false
    }
  }

  # Yum definitions
  $keepcache = '1'

  # Repository definitions
  $el5Sl                          = 'mirrorlist=ftp://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-base-510.txt'
  $el5Custom                      = 'baseurl=http://repo.intranet.local/rhel/$releasever/$basearch/'
  $el6Sl                          = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-base-6.txt'
  $el6SlSecurity                  = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-security-6.txt'
  $el6SlSource                    = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/$releasever/SRPMS/'
  $el6xSl                         = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-base-6x.txt'
  $el6xSlSecurity                 = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-security-6x.txt'
  $el6xSlFastbugs                 = 'mirrorlist=http://ftp.scientificlinux.org/linux/scientific/mirrorlist/sl-fastbugs-6x.txt'
  $el6Softwarecollections         = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/6x/external_products/softwarecollections/$basearch/'
  $el6SoftwarecollectionsSource   = 'baseurl=http://ftp.scientificlinux.org/linux/scientific/6x/external_products/softwarecollections/SRPMS/'
  $el6Epel                        = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch'
  $el6EpelDebuginfo               = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-$releasever&arch=$basearch'
  $el6EpelSource                  = 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-$releasever&arch=$basearch'
  $el6EpelTesting                 = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=$basearch'
  $el6EpelTestingDebuginfo        = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel6&arch=$basearch'
  $el6EpelTestingSource           = 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel6&arch=$basearch'
  $el6PuppetlabsProducts          = 'baseurl=http://yum.puppetlabs.com/el/6/products/$basearch/'
  $el6PuppetlabsProductsSource    = 'baseurl=http://yum.puppetlabs.com/el/6/products/SRPMS/'
  $el6PuppetlabsDeps              = 'baseurl=http://yum.puppetlabs.com/el/6/dependencies/$basearch/'
  $el6PuppetlabsDepsSource        = 'baseurl=http://yum.puppetlabs.com/el/6/dependencies/SRPMS/'
  $el6PuppetlabsDevel             = 'baseurl=http://yum.puppetlabs.com/el/6/devel/$basearch/'
  $el6PuppetlabsDevelSource       = 'baseurl=http://yum.puppetlabs.com/el/6/devel/SRPMS/'
  $el6Foreman                     = 'baseurl=http://yum.theforeman.org/releases/1.4/el6/$basearch/'
  $el6ForemanSource               = 'baseurl=http://yum.theforeman.org/releases/1.4/el6/source/'
  $el6ForemanPlugins              = 'baseurl=http://yum.theforeman.org/plugins/1.4/el6/$basearch/'
  $el6ForemanPluginsSource        = 'baseurl=http://yum.theforeman.org/plugins/1.4/el6/source/'
  $el6Passenger                   = 'baseurl=http://passenger.stealthymonkeys.com/rhel/6rolling/$basearch/'
  $el6PassengerTesting            = 'baseurl=http://passenger.stealthymonkeys.com/rhel/6rolling/$basearch/testing/'
  $el6Custom                      = 'baseurl=http://repo.intranet.local/rhel/$releasever/$basearch/'

  # File definitions
  $el5SlFile                  = '/etc/yum.repos.d/sl.repo'
  $el5CustomFile              = '/etc/yum.repos.d/custom.repo'
  $el6SlFile                  = '/etc/yum.repos.d/sl.repo'
  $el6xSlFile                 = '/etc/yum.repos.d/sl6x.repo'
  $el6SoftwarecollectionsFile = '/etc/yum.repos.d/softwarecollections.repo'
  $el6EpelFile                = '/etc/yum.repos.d/epel.repo'
  $el6EpelTestingFile         = '/etc/yum.repos.d/epel-testing.repo'
  $el6PuppetlabsFile          = '/etc/yum.repos.d/puppetlabs.repo'
  $el6ForemanFile             = '/etc/yum.repos.d/foreman.repo'
  $el6ForemanPluginsFile      = '/etc/yum.repos.d/foreman-plugins.repo'
  $el6PassengerFile           = '/etc/yum.repos.d/passenger.repo'
  $el6CustomFile              = '/etc/yum.repos.d/custom.repo'

  # Template definitions
  $el5SlTemplate                  = 'yum/etc/yum.repos.d/el5/sl.repo.erb'
  $el5CustomTemplate              = 'yum/etc/yum.repos.d/el5/custom.repo.erb'
  $el6SlTemplate                  = 'yum/etc/yum.repos.d/el6/sl.repo.erb'
  $el6xSlTemplate                 = 'yum/etc/yum.repos.d/el6/sl6x.repo.erb'
  $el6SoftwarecollectionsTemplate = 'yum/etc/yum.repos.d/el6/softwarecollections.repo.erb'
  $el6EpelTemplate                = 'yum/etc/yum.repos.d/el6/epel.repo.erb'
  $el6EpelTestingTemplate         = 'yum/etc/yum.repos.d/el6/epel-testing.repo.erb'
  $el6PuppetlabsTemplate          = 'yum/etc/yum.repos.d/el6/puppetlabs.repo.erb'
  $el6ForemanTemplate             = 'yum/etc/yum.repos.d/el6/foreman.repo.erb'
  $el6ForemanPluginTemplate       = 'yum/etc/yum.repos.d/el6/foreman-plugins.repo.erb'
  $el6PassengerTemplate           = 'yum/etc/yum.repos.d/el6/passenger.repo.erb'
  $el6CustomTemplate              = 'yum/etc/yum.repos.d/el6/custom.repo.erb'
}

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
  $el5Sl                          = ''
  $el5Custom                      = ''
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

  # Template definitions
  $el5SlTemplate                  = ''
  $el5CustomTemplate              = ''
  $el6SlTemplate                  = ''
  $el6xSlTemplate                 = ''
  $el6SoftwarecollectionsTemplate = ''
  $el6EpelTemplate                = ''
  $el6PuppetlabsTemplate          = ''
  $el6ForemanTemplate             = ''
  $el6PassengerTemplate           = ''
  $el6CustomTemplate              = ''
}

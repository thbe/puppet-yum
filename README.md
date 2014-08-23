#yum

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with yum](#setup)
    * [What yum affects](#what-yum-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with yum](#beginning-with-yum)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)


##Overview

The yum module provides several repositories available for RPM based RHEL 6 clones like
CentOS or Scientific Linux.

##Module Description

The yum module provides several repositories available for RPM based RHEL 6 clones like
CentOS or Scientific Linux.

##Setup

###What yum affects

* yum package.
* yum configuration file.
* yum repository configuration.

###Beginning with yum

include '::yum' is enough to get you up and running if the parameters point to
proper values.  If you wish to pass in parameters like which repositories to use
then you can use:

```puppet
class { '::yum':
  repoForeman => true,
}
```

or you can use it like this:

```puppet
include yum
include yum::config::foreman
```

##Usage

All interaction with the yum module can do be done through the main yum class.
This means you can simply toggle the options in the yum class to get at the full
functionality. You also have the possibility to include classes in the order you
need.

###I just want yum, what's the minimum I need?

```puppet
include '::yum'
```

###I just want to add CoreOS, EPEL, SC and Puppet plus Foreman

```puppet
class { '::yum':
  repoForeman => true,
}
```


##Reference

###Classes

* yum: Main class, includes all the rest.
* yum::install: Handles the packages.
* yum::config: Handles the configuration file.

###Parameters

The following parameters are available in the yum module

####`repoSl`

Enable SL and SLx repository.

####`repoCentos`

Enable CentOS repository.

####`repoSoftwarecollections`

Enable Software Collections repository.

####`repoEpel`

Enable EPEL repository.

####`repoPuppetlabs`

Enable Puppetlabs repository.

####`repoForeman`

Enable Foreman repository.

####`repoPassenger`

Enable Passenger repository.

####`repoOvirt`

Enable Ovirt repository.

####`repoCustom`

Enable custom repository.

####`Additional parameters`
```puppet
$elSl                        = $yum::params::elSl
$elSlSecurity                = $yum::params::elSlSecurity
$elSlSource                  = $yum::params::elSlSource
$elSlx                       = $yum::params::elSlx
$elSlxSecurity               = $yum::params::elSlxSecurity
$elSlxFastbugs               = $yum::params::elSlxFastbugs
$elSoftwarecollections       = $yum::params::elSoftwarecollections
$elSoftwarecollectionsSource = $yum::params::elSoftwarecollectionsSource
$elEpel                      = $yum::params::elEpel
$elEpelDebuginfo             = $yum::params::elEpelDebuginfo
$elEpelSource                = $yum::params::elEpelSource
$elEpelTesting               = $yum::params::elEpelTesting
$elEpelTestingDebuginfo      = $yum::params::elEpelTestingDebuginfo
$elEpelTestingSource         = $yum::params::elEpelTestingSource
$elPuppetlabsProducts        = $yum::params::elPuppetlabsProducts
$elPuppetlabsProductsSource  = $yum::params::elPuppetlabsProductsSource
$elPuppetlabsDeps            = $yum::params::elPuppetlabsDeps
$elPuppetlabsDepsSource      = $yum::params::elPuppetlabsDepsSource
$elPuppetlabsDevel           = $yum::params::elPuppetlabsDevel
$elPuppetlabsDevelSource     = $yum::params::elPuppetlabsDevelSource
$elForeman                   = $yum::params::elForeman
$elForemanSource             = $yum::params::elForemanSource
$elForemanPlugins            = $yum::params::elForemanPlugins
$elForemanPluginsSource      = $yum::params::elForemanPluginsSource
$elPassenger                 = $yum::params::elPassenger
$elPassengerTesting          = $yum::params::elPassengerTesting
$elCustom                    = $yum::params::elCustom
```

##Limitations

This module has been built on and tested against Puppet 3.6 and higher.

The module has been tested on:

* CentOS Linux 6
* Scientific Linux 6

Testing on other platforms has been light and cannot be guaranteed.

This module does currently only support a limited set of distributions and need to be
reworked for other distributions as well. I use static files instead of the yum provider
to stay in sync with the files that the repository creators deliver. Some more parameters
can be implemented, i.e., activating or disabling repositories and features is currently
only possible inside the template. That should be implemented as parameters in the
future.

##Development

If you like to add or improve this module, feel free to fork the module and send
me a merge request with the modification.

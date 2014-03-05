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

The yum module provides several repositories available for RPM based systems.

##Module Description

The yum module provides several repositories available for RPM based systems.

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
  repoSl   => true,
  repoEpel => true,
}
```

##Usage

All interaction with the yum module can do be done through the main yum class.
This means you can simply toggle the options in the yum class to get at the full
functionality.

###I just want yum, what's the minimum I need?

```puppet
include '::yum'
```

###I just want to add SL, SLx and EPEL

```puppet
class { '::yum':
  repoSl   => true,
  repoEpel => true,
}
```


##Reference

###Classes

* yum: Main class, includes all the rest.
* yum::install: Handles the packages.
* yum::config: Handles the configuration file.

###Parameters

The following parameters are available in the yum module

####`repoSL`

Enable SL and SLx repository.

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

####`repoCustom`

Enable custom repository.

####`Additional parameters`
```puppet
$el5Sl                        = $yum::params::el5Sl,
$el5Custom                    = $yum::params::el5Custom,
$el6Sl                        = $yum::params::el6Sl,
$el6SlSecurity                = $yum::params::el6SlSecurity,
$el6SlSource                  = $yum::params::el6SlSource,
$el6xSl                       = $yum::params::el6xSl,
$el6xSlSecurity               = $yum::params::el6xSlSecurity,
$el6xSlFastbugs               = $yum::params::el6xSlFastbugs,
$el6Softwarecollections       = $yum::params::el6Softwarecollections,
$el6SoftwarecollectionsSource = $yum::params::el6SoftwarecollectionsSource,
$el6Epel                      = $yum::params::el6Epel,
$el6EpelDebuginfo             = $yum::params::el6EpelDebuginfo,
$el6EpelSource                = $yum::params::el6EpelSource,
$el6EpelTesting               = $yum::params::el6EpelTesting,
$el6EpelTestingDebuginfo      = $yum::params::el6EpelTestingDebuginfo,
$el6EpelTestingSource         = $yum::params::el6EpelTestingSource,
$el6PuppetlabsProducts        = $yum::params::el6PuppetlabsProducts,
$el6PuppetlabsProductsSource  = $yum::params::el6PuppetlabsProductsSource,
$el6PuppetlabsDeps            = $yum::params::el6PuppetlabsDeps,
$el6PuppetlabsDepsSource      = $yum::params::el6PuppetlabsDepsSource,
$el6PuppetlabsDevel           = $yum::params::el6PuppetlabsDevel,
$el6PuppetlabsDevelSource     = $yum::params::el6PuppetlabsDevelSource,
$el6Foreman                   = $yum::params::el6Foreman,
$el6ForemanSource             = $yum::params::el6ForemanSource,
$el6ForemanPlugins            = $yum::params::el6ForemanPlugins,
$el6ForemanPluginsSource      = $yum::params::el6ForemanPluginsSource,
$el6Passenger                 = $yum::params::el6Passenger,
$el6PassengerTesting          = $yum::params::el6PassengerTesting,
$el6Custom                    = $yum::params::el6Custom
```

##Limitations

This module has been built on and tested against Puppet 3.2 and higher.

The module has been tested on:

* RedHat Enterprise Linux 5/6
* Scientific Linux 5/6

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

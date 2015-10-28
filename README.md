#yum

[![Build Status](https://travis-ci.org/thbe/puppet-yum.png?branch=master)](https://travis-ci.org/thbe/puppet-yum)
[![Puppet Forge](https://img.shields.io/puppetforge/v/thbe/yum.svg)](https://forge.puppetlabs.com/thbe/yum)
[![Coverage Status](https://coveralls.io/repos/thbe/puppet-yum/badge.svg?branch=master&service=github)](https://coveralls.io/github/thbe/puppet-yum?branch=master)

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
  repo_foreman => true,
}
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
  repo_foreman => true,
}
```


##Reference

###Classes

* yum: Main class, includes all the rest.
* yum::install: Handles the packages.
* yum::config: Handles the configuration file.

###Parameters

The following parameters are available in the yum module

####`manage`

Define if yum repositories are managed by module

####`tmpfs`

Define if yum repositories should be stored on tmpfs instead of harddisk

####`auto_update`

Define if yum should automatically update the system every night

####`yum_exclude`

List of RPMs that are exclude during yum run

####`yum_proxy`

Should yum proxy be used and if yes, define URL,
i.e. http://mycache.mydomain.com:3128

####`yum_proxy_user`

Use defined user to connect to proxy server

####`yum_proxy_password`

Use defined password to connect to proxy server

####`repo_sl`

Enable SL and SLx repository.

####`repo_centos`

Enable CentOS repository.

####`repo_softwarecollections`

Enable Software Collections repository.

####`repo_epel`

Enable EPEL repository.

####`repo_puppetlabs`

Enable Puppetlabs repository.

####`repo_foreman`

Enable Foreman repository.

####`repo_passenger`

Enable Passenger repository.

####`repo_ovirt`

Enable Ovirt repository.

####`repo_icinga`

Enable Icinga repository.

####`repo_custom`

Enable custom repository.

####`repo_upgradetool`

Enable upgradetool repository.

####`Additional parameters`
```puppet
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
$el_softwarecollections_source  = $yum::params::el_softwarecollections_source
```

##Limitations

This module has been built on and tested against Puppet 3.7 and higher.

The module has been tested on:

* CentOS Linux 6, 7
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

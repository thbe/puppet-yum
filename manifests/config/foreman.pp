# Class: yum::config::foreman
#
# This module contain the configuration for yum Foreman repository
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::foreman {
  file {
    $yum::params::el_foreman_file:
      ensure  => file,
      mode    => '0644',
      notify  => Exec['yum-cache', 'yum-rpm-key-import'],
      content => template($yum::params::el_foreman_template);

    $yum::params::el_foreman_plugins_file:
      ensure  => file,
      mode    => '0644',
      notify  => Exec['yum-cache', 'yum-rpm-key-import'],
      content => template($yum::params::el_foreman_plugins_template);
  }
}

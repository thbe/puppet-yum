# Class: yum::config::yum
#
# This module contain the configuration for yum
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage:
#
class yum::config::yum {
  # yum configuration
  file { $yum::params::config_yum_conf:
    ensure  => file,
    mode    => '0644',
    content => template($yum::params::config_yum_conf_template);
  }

  if $yum::auto_update {
    file { $yum::params::config_yum_conf:
      ensure  => file,
      mode    => '0644',
      content => template($yum::params::config_yum_conf_template);
    }
    if $yum::auto_update_complete {
      file { $yum::params::config_yum_autoupdate:
        ensure  => file,
        mode    => '0644',
        content => template($yum::params::config_yum_autoupdate_template);
      }
      file { $yum::params::config_yum_sysconfig_cron:
        ensure  => file,
        mode    => '0644',
        content => template($yum::params::config_yum_sysconfig_cron_template);
      }
    }
  }
}

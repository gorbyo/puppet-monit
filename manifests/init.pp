# Class: monit
#
# This module manages monit
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class monit(
  $interval   = 120,
  $httpd      = false,
  $use_syslog = true,
  $ip_listen  = 'localhost',
  $ip_allow   = 'localhost',
  $username   = 'admin',
  $password   = 'monit',
) {

  class {'monit::package':
    notify  => Class['monit::service'],
  }

  class {'monit::config':
    interval   => $interval,
    httpd      => $httpd,
    use_syslog => $use_syslog,
    notify     => Class['monit::service'],
    require    => Class['monit::package'],
    ip_listen  => $ip_listen,
    ip_allow   => $ip_allow,
    username   => $username,
    password   => $password,
  }

  class {'monit::service':
    require => Class['monit::config'],
  }

}

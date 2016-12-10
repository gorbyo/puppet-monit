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
  $interval       = $monit::config::interval,
  $use_syslog     = $monit::config::use_syslog,
  $httpd          = $monit::config::httpd,
  $httpd_listen   = $monit::config::httpd_listen,
  $httpd_allow    = $monit::config::httpd_allow,
  $httpd_username = $monit::config::httpd_username,
  $httpd_password = $monit::config::httpd_password,
  $mailserver     = $monit::config::mailserver,
  $alert_emails  = $monit::config::alert_emails,
) {

  class {'monit::package':
    notify  => Class['monit::service'],
  }

  class {'monit::config':
    interval       => $interval,
    use_syslog     => $use_syslog,
    httpd          => $httpd,
    httpd_listen   => $httpd_listen,
    httpd_allow    => $httpd_allow,
    httpd_username => $httpd_username,
    httpd_password => $httpd_password,
    mailserver     => $mailserver,
    alert_emails   => $alert_emails,
    notify         => Class['monit::service'],
    require        => Class['monit::package'],
  }

  class {'monit::service':
    require => Class['monit::config'],
  }

}

# Configure monit daemon
#
# [use_syslog] - Use syslog for monit logs. Optional. Default false.
# [interval] - Status polling interval for monit. Optional. Default 30 sec.
#
class monit::config (
  $use_syslog     = false,
  $interval       = 30,
  $httpd          = false,
  $httpd_listen   = 'localhost',
  $httpd_allow    = 'localhost',
  $httpd_username = 'admin',
  $httpd_password = 'monit',
  $mailserver     = 'localhost',
  $alert_emails   = 'admin@localhost',
) {

  include monit::params
  $config = $::monit::params::config
  $included = $::monit::params::included
  $idfile = $::monit::params::idfile
  $statefile = $::monit::params::statefile
  $basedir = $::monit::params::basedir

  file { $config :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('monit/monitrc.erb'),
  }

}

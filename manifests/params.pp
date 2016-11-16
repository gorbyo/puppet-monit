#
class monit::params {
  case $::osfamily {
    'RedHat' : {
      $idfile     = '/var/lib/monit/.id'
      $statefile  = '/var/lib/monit/.state'
      $basedir    = '/var/lib/monit'
      $included   = '/etc/monit.d'
      $config     = '/etc/monitrc'

      file { $basedir:
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0750',
      }
    }
    'Debian' : {
      $idfile     = '/var/lib/monit/id'
      $statefile  = '/var/lib/monit/state'
      $basedir    = '/var/lib/monit/events'
      $included   = '/etc/monit/conf.d'
      $config     = '/etc/monit/monitrc'
    }
    default  : {
      fail("Unsupported osfamily: ${osfamily} for os ${operatingsystem}")
    }
  }
}

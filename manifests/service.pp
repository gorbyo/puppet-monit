class monit::service {

  service {'monit':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['monit']
  }

}

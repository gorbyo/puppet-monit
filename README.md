# Monit Module

This module manages installing, configuring and running processes using monit.

## Parameters

### General
  * httpd: enable web ui. default: false
  * httpd_listen: ip address of network interface. default: 'localhost'
  * httpd_allow: trusted host or network for remote access.  default: 'localhost'
  * httpd_username: trusted user. default: 'admin'
  * httpd_password: password for trusted user. default: 'monit'

### Process
 * ensure: running, stopped. default: running
 * start_command: Command line to start service.
 * stop_command: Command line to stop service.
 * pidfile: Location to find the pid file.

## Usage
    class { 'monit':
      interval   => 120,
      use_syslog => false,
      httpd      => true,
      httpd_listen  => 'localhost',
      httpd_allow   => 'localhost',
      httpd_username   => 'admin',
      httpd_password   => 'monit',
    }

### SysV or Systemd with PID
    monit::process {'myapp':
      ensure        => running,
      start_command => '/etc/init.d/myapp start',
      stop_command  => '/etc/init.d/myapp stop',
      pidfile       => '/var/run/myapp/myapp.pid',
    }

### Systemd without PID
    monit::process {'myapp':
      ensure        => running,
      start_command => '/usr/bin/systemctl start myapp.service',
      stop_command  => '/usr/bin/systemctl stop myapp.service',
    }

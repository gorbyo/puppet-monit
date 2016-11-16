# Monit Module

This module manages installing, configuring and running processes using monit.

## Parameters

 * ensure: running, stopped. default: running
 * start_command: Command line to start service.
 * stop_command: Command line to stop service.
 * pidfile: Location to find the pid file.

## Usage
    class { 'monit':
      interval   => 120,
      httpd      => true,
      use_syslog => false,
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

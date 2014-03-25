# This file manages the installation of project open

define projectopen (

  $address      = '0.0.0.0',
  $companyname  = 'company',
  $dbname       = 'projop',
  $debug        = true,
  $group        = 'projop',
  $hostname     = 'hostname',
  $httpport     = '8000',
  $httpsport    = '8443',
  $password     = 'projop',
  $serverroot   = '/web',
  $superuser    = 'postgres',
  $user         = 'projop',

) {

  include projectopen::packages

  # Fix the path issue
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

  class { 'projectopen::users_and_groups':
    dbname      => $dbname,
    group       => $group,
    serverroot  => $serverroot,
    user        => $user,
  }
  ->
  class {'projectopen::project_open_archives':
    dbname      => $dbname,
    homedir     => '/usr/local',
    serverroot  => $serverroot,
  }
  ->
  class {'projectopen::permissions':
    group       => $group,
    homedir     => '/usr/local',
    server      => $dbname,
    serverroot  => $serverroot,
    user        => $user,
  }
  ->
  class { 'projectopen::postgresql_ins':
    dbname      => $dbname,
    password    => $password,
    root        => $superuser,
    server      => $::server,
    serverroot  => $serverroot,
    user        => $user,
  }
  ->
  class { 'projectopen::firewall_ins':
    port   => $httpport,
    sport  => $httpsport,
  }
  ->
  class {'projectopen::projectopen_config':
    address     => $::adddress,
    dbname      => $dbname,
    debug       => $debug,
    homedir     => '/usr/local',
    hostname    => $hostname,
    httpport    => $httpport,
    httpsport   => $httpsport,
    server      => $user,
    servername  => $companyname,
    serverroot  => $serverroot,
  }
  ->
  file { '/etc/init.d/projectopen':
    path     => '/etc/init.d/projectopen',
    content  => template('projectopen/projectopen.erb'),
    mode     => '0755',
  }

#  service { "projectopen":
#    name     => "nds",
#    ensure   => true,
#    start    => "service projectopen start",
#    stop     => "service projectopen stop",
#    restart  => "service projectopen restart",
#    require  => File['/etc/init.d/projectopen'],
#  }
}
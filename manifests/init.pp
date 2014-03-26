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

  # Fix the path issue
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

  class { 'projectopen::packages':}
  ->
  class { 'projectopen::users_and_groups':
    dbname      => $dbname,
    group       => $group,
    serverroot  => $serverroot,
    user        => $user,
  }
  ->
  # Ugly package fix till packages are available on repo
#  exec { 'Installing projectopen-dbname':
#    command  => "yum install /vagrant/modules/projectopen/files/projectopen-dbname-1.0-1.x86_64.rpm /vagrant/modules/projectopen/files/projectopen-aolserver-1.0-1.x86_64.rpm -y",
#    creates  => "${serverroot}/${dbname}/README.project-open.4.0.4.0.0.txt",
#  }
#  ->
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
}
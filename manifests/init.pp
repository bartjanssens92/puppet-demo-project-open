# This file manages the installation of project open

define projectopen (

  $address      = '0.0.0.0',
  $companyname  = 'company',
  $dbname       = 'projop',
  $debug        = false,
  $group        = 'projop',
  $hostname     = 'hostname',
  $httpport     = '8000',
  $httpsport    = '8443',
  $password     = 'projop',
  $serverroot   = '/web',
  $superuser    = 'postgres',
  $user         = 'projop',

) {

#
# Fixing the path resource so it doesn't need to be defined at every exec.
#
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

  class { 'projectopen::packages': }
  ->
  class { 'projectopen::users_and_groups':
    dbname      => $dbname,
    group       => $group,
    serverroot  => $serverroot,
    user        => $user,
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

#
# Looking if the path of projectopen is right and move it if it isn't
#

  if ! ( $serverroot == '/web') {
    if ! ( $dbname == 'projop') {
      exec { "Move the package /web/projop to ${serverroot}/${dbname}":
        command  => "mkdir ${serverroot} ${serverroot}/${dbname} && mv /web/projop/* ${serverroot}/${dbname} && rm /web -rf",
        require  => [ Package['projectopen-aolserver'], Package['projectopen-dbname'] ],
        creates  => "${serverroot}/${dbname}/README.project-open.4.0.4.0.0.txt",
      }
    } else {
      exec { "Move the package /web to ${serverroot}/${dbname}":
        command  => "mkdir ${serverroot} && mv /web/* ${serverroot} && rm /web -rf",
        require  => [ Package['projectopen-aolserver'], Package['projectopen-dbname'] ],
        creates  => "${serverroot}/${dbname}/README.project-open.4.0.4.0.0.txt",
      }
    }
  }

  if ! ( $dbname == 'projop') {
    exec { "Move the package /projop to ${serverroot}/${dbname}":
      command  => "mkdir ${serverroot}/${dbname} && mv /web/projop/* ${serverroot}/${dbname} && rm /web/projop -rf",
      require  => [ Package['projectopen-aolserver'], Package['projectopen-dbname'] ],
      creates  => "${serverroot}/${dbname}/README.project-open.4.0.4.0.0.txt",
    }
  }

#
# Checking if the parameters don't contain illegal characters.
#

  if ! ( $address =~ /([0-9]|\.)/ ) {
    fail ( "The address: ${address} is not valid, please use 0-9.0-9.0-9.0-9" )
  }

  if ! ( $dbname =~ /([a-z]|[A-Z]|[0-9])/ ) {
    fail ( "The dbname: ${dbname} is not valid, please use a-z, A-Z and 0-9")
  }

  if ! ( $debug == true or $debug == false) {
    fail ( "The debug-value ${debug} is not valid, please use true or false without '' ")
  }

  if ! ( $group =~ /([a-z]|[A-Z]|[0-9])/ ) {
    fail ( "The group name: ${group} is not valid, please use a-z, A-Z and 0-9")
  }

  if ! ( $hostname =~ /([a-z]|[A-Z]|[0-9])/ ) {
    fail ( "The hostname: ${hostname} is not valid, please use a-z, A-Z and 0-9")
  }

  if ! ( $httpport =~ /[0-9]*/ ) {
    fail ( "The httpport: ${httpport} is not valid please use 0-9")
  }

  if ! ( $httpsport =~ /[0-9]*/ ) {
    fail ( "The httpsport: ${httpport} is not valid please use 0-9")
  }

  if ! ( $serverroot =~ /\/([A-Z]|[a-z])*/ ) {
    fail ( "The serverroot name: ${serverroot} is not valid please use /a-z, A-Z")
  }

  if ! ( $superuser =~ /([a-z]|[A-Z]|[0-9])/ ) {
    fail ( "The superuser name: ${superuser} is not valid, please use a-z, A-Z and 0-9")
  }

  if ! ( $user =~ /([a-z]|[A-Z]|[0-9])/ ) {
    fail ( "The user name: ${user} is not valid, please use a-z, A-Z and 0-9")
  }
}
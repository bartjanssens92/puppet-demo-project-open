# This class manages the postgresql stuff

class projectopen::postgresql_ins (

  $dbname      = undef,
  $password    = undef,
  $root        = undef,
  $server      = undef,
  $serverroot  = undef,
  $user        = undef,

) {
  class {'postgresql::server': }
  ->
  postgresql::server::db { $dbname:
    user     => $user,
    password => postgresql_password($user, $password),
  }
  ->
  postgresql::server::config_entry { 'add_missing_from':  value => 'on', }
  ->
  postgresql::server::config_entry { 'regex_flavor':      value => 'extended', }
  ->
  postgresql::server::config_entry { 'default_with_oids': value => 'on', }
  ->
  exec { 'enable the procedural language PlPg/SQL':
    command => "su - ${root} -c 'createlang plpgsql ${dbname}'",
    creates => '/tmp/.postgresqlOK.txt',
  }
  ->
  exec { 'load the database dump into the database that was part of the project-open-Update.x.y.z.tgz':
    command => "/bin/su - ${user} -c \"psql -d ${dbname} -U ${user} -f ${serverroot}/${dbname}/pg_dump.4.0.4.0.0.sql > import.log 2>&1\"",
    creates => '/tmp/.postgresqlOK.txt',
  }
  ->
  file { '/tmp/.postgresqlOK.txt':
      ensure  => file,
      content => 'Does it work?',
  }
}
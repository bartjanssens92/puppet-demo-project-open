# This class configures postgersql to work 

define projectopen::postgresql_ins (

	$dbname,
	$password,
	$root,	
	$server,
	$serverroot,
	$user,	

) {

        class { 'postgresql::server': }
        ->
        postgresql::server::db { "${dbname}":
                user            => "${user}",
                password        => postgresql_password("${user}", $password),
                grant           => 'all',
        }
        ->
        postgresql::server::config_entry { 'add_missing_from':  value => 'on', }
        ->
        postgresql::server::config_entry { 'regex_flavor':      value => 'extended', }
        ->
        postgresql::server::config_entry { 'default_with_oids': value => '', }
        ->
        exec { 'enable the procedural language PlPg/SQL':
                command => "su - $root -c 'createlang plpgsql ${dbname}'",
                creates => '/home/vagrant/.postgresqlOK.txt',
        }
        ->
        exec { 'load the database dump into the database that was part of the project-open-Update.x.y.z.tgz':
                command => "/bin/su - ${user} -c \"psql -d ${dbname} -U ${user} -f ${serverroot}/${dbname}/pg_dump.4.0.4.0.0.sql > import.log 2>&1\"",
                creates => '/home/vagrant/.postgresqlOK.txt',
        }
        ->
        file { '/home/vagrant/.postgresqlOK.txt':
                ensure  => file,
                content => 'Does it work?',
        }
}

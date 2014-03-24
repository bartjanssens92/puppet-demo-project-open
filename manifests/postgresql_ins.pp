# This class configures postgersql to work 

class projectopen::postgresql_ins (

	$dbname,
	$password,
	$root,	
	$server,
	$serverroot,
	$user,	

) {
        postgres::createuser{ "$user":passwd => "${password}",}
        ->
        postgres::createdb{"${dbname}":owner=> "${user}",}
        ->
        postgres::config { 'add_missing_from':  value => 'on', }
        ->
        postgres::config { 'regex_flavor':      value => 'extended', }
        ->
        postgres::config { 'default_with_oids': value => '', }
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

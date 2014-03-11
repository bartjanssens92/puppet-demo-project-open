# This class configures postgersql to work 

define projectopen::postgresql_ins (

	$password,
	$port,
	$root,
	

) {

        class { 'postgresql::server': }
        ->
        postgresql::server::db { "projop":
                user            => 'projop',
                password        => postgresql_password('projop', $password),
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
                command => "su - $root -c 'createlang plpgsql projop'",
                creates => '/home/vagrant/.postgresqlOK.txt',
        }
        ->
        exec { 'load the database dump into the database that was part of the project-open-Update.x.y.z.tgz':
                command => "/bin/su - projop -c \"psql -d projop -U projop -f /web/projop/pg_dump.4.0.4.0.0.sql > import.log 2>&1\"",
                creates => '/home/vagrant/.postgresqlOK.txt',
        }
        ->
        file { '/home/vagrant/.postgresqlOK.txt':
                ensure  => file,
                content => 'Does it work?',
        }
        ->
        file_line { 'Setting configuration inn the config.tcl':
                path    => "/web/projop/etc/config.tcl",
                line    => 'set homedir      /usr/local/aolserver451_rc2',
                match   => '[set]{3}\s[a-z]{7}\s*\/[usr]{3}\/[local]{5}\/[a-z]{9}[451]{3}',
        }
        ->
        file_line { 'Setting the port config in config.tcl':
                path    => "/web/projop/etc/config.tcl",
                line    => "set httpport            ${port}",
                match   => '[set]{3}\s[httpport]{8}\s*',
        }


}

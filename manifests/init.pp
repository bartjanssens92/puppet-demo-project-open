# This file manages the installation of project open

class projectopen (

	$group		= 'projop',
	$password	= 'projop',
	$root		= 'postgres',
	$port		= '8000',

) {

	include basic_config	
	include basic_webserver
	include packages


$projectopen = "#!/bin/sh

/usr/local/aolserver451_rc2/bin/nsd -it /web/projop/etc/config.tcl -u projop -g ${group} &
exit 0"

	# Fix the path issue
	Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

	users_and_groups { "Making the user and group":
		group	=> $group,
	}
        ->
	project_open_archives { 'Get the nessecery files for project open': }
	->
	permissions { "Get the permissions right":
		group	=> $group,
	}
	->
	postgresql_ins { "Get postgresql up and configured":
		password	=> $password,
		port		=> $port,
		root		=> $root,
	}
	->
	opening_ports { "Opening ports":
		port	=> $port,
	}
	->
	# Start project open on port 8000
        file { '/etc/init.d/projectopen.sh':
                ensure  => file,
                content => $projectopen
        }
        ->
        exec { 'Getting the premissions right for projectopen.sh':
                command => 'chmod 555 /etc/init.d/projectopen.sh',
        }
        ->
        service {'projectopen.sh':
                ensure  => 'running',
        }
}

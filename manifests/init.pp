# This file manages the installation of project open

define projectopen (
	
	$companyname	= 'company',
	$group		= 'projop',
	$password	= 'projop',
	$port		= '8000',
	$root		= 'postgres',

) {

	include projectopen::packages

	# Fix the path issue
	Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

	projectopen::users_and_groups { "Making the user and group":
		group	=> $group,
	}
        ->
	projectopen::project_open_archives { 'Get the nessecery files for project open': }
	->
	projectopen::permissions { "Get the permissions right":
		group	=> $group,
	}
	->
	projectopen::postgresql_ins { "Get postgresql up and configured":
		companyname	=> $companyname,
		password	=> $password,
		port		=> $port,
		root		=> $root,
	}
	->
	projectopen::opening_ports { "Opening ports":
		port	=> $port,
	}
	->
	projectopen::projectopen_config { "Configuring project open":
		httpport	=> $port,
		hostname	=> "bart",
	}
	->
	projectopen::start { "Start project open on port ${port}":
		group		=> $group,
	}
}

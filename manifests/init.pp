# This file manages the installation of project open

define projectopen (
	
	$address		= "0.0.0.0",
	$companyname	= "company",
	$dbname			= "projop",
	$debug			= "true",
	$group			= "projop",
	$hostname		= "hostname",
	$httpport		= "8000",
	$httpsport		= "8443",
	$password		= "projop",
	$root			= "postgres",
	$serverroot		= "/web",
	$user			= "projop",

) {
	
	include projectopen::packages

	# Fix the path issue
	Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

	projectopen::users_and_groups { "Making the user and group":
		dbname		=> $dbname,
		group		=> $group,
		serverroot	=> $serverroot,
		user		=> $user,
	}
        ->
	projectopen::project_open_archives { 'Get the nessecery files for project open': 
		dbname		=> $dbname,
		homedir		=> "/usr/local",
		serverroot	=> $serverroot,
	}
	->
	projectopen::permissions { "Get the permissions right":
		group		=> $group,
		homedir		=> "/usr/local",
		server		=> $dbname,
		serverroot	=> $serverroot,
		user		=> $user,
	}
	->
	projectopen::postgresql_ins { "Get postgresql up and configured":
		dbname		=> $dbname,
		password	=> $password,
		root		=> $root,
		server		=> $server,
		serverroot	=> $serverroot,
		user		=> $user,
	}
	->
	projectopen::opening_ports { "Opening ports":
		port	=> $httpport,
	}
	->
	projectopen::projectopen_config { "Configuring project open":
		address		=> $adddress,
		dbname		=> $dbname,
		debug		=> $debug,
		homedir		=> "/usr/local",
		hostname	=> $hostname,
		httpport	=> $httpport,
		httpsport	=> $httpsport,
		server		=> $user,
		servername	=> $companyname,
		serverroot	=> $serverroot,
	}
	->
	projectopen::start { "Start project open on port ${port}":
		dbname		=> $dbname,
		group		=> $group,
		serverroot	=> $serverroot,
		user		=> $user,
	}

}

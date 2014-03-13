# This class makes the service file to start project open

define projectopen::start (

	$dbname,
	$group,
	$serverroot,
	$user,

) {

        file { "/etc/init.d/projectopen.sh":
		path	=> "/etc/init.d/projectopen.sh",
                content => template("projectopen/projectopen.erb"),
        }
        ->
        exec { 'Getting the premissions right for projectopen':
                command => 'chmod 555 /etc/init.d/projectopen',
        }
        ->
        service {'projectopen':
                ensure  => 'running',
        }
}

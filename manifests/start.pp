# This class makes the service file to start project open

define projectopen::start (

	$dbname,
	$group,
	$serverroot,
	$user,

) {

        file { "/etc/init.d/projectopen.sh":
		path	=> "/etc/init.d/projectopen.sh",
                content => template("projectopen/projectopen.sh.erb"),
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

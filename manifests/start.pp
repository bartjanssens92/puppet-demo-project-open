# This class makes the service file to start project open

define projectopen::start (

	$group,
	$projectopen 	= "# This file is needed to start project open, this is an init file and needs improvement
#!/bin/sh
/usr/local/aolserver451_rc2/bin/nsd -it /web/projop/etc/config.tcl -u projop -g ${group} &
exit 0"

){

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

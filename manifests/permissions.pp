# This class manages the permissions for project open

define projectopen::permissions (

	$group,
	$homedir,
	$serverroot,
	$server,
	$user,

) {

	exec { "chown":
                command => "/bin/chown -R ${user}:${group} ${serverroot}/${server}",
                require => Class ["packages"],
                creates => "/home/vagrant/.postgresqlOK.txt",
	}
	->
	file { "Giving the right permissions for ${homedir}aolserver folder":
                path    => "${homedir}/*",
                group   => $group,
                owner   => "${user}",
        }

}

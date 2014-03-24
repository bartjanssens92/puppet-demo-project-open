# This class manages the permissions for project open

define projectopen::permissions (

	$group,
	$homedir,
	$serverroot,
	$server,
	$user,

) {

	file { "Giving permisions to ${serverroot}/${server}/log":
	    path	=> "${serverroot}/${server}/log",
        require => Class ["packages"],
        owner	=> "${user}",
        group 	=> "${group}",
        mode	=> "0750",
	}

	file  { "Giving permisions to ${serverroot}/${server}":
		path 	=> "${serverroot}/${server}",
		owner	=> "${user}",
		group 	=> "${group}",
	}

	file { "Giving the right permissions for ${homedir}aolserver folder":
        path    => "${homedir}/*",
       	group   => "${group}",
        owner   => "${user}",
    }

    file { "Giving the right permissions for ${serverroot}/${server}/www":
    	path	=> "${serverroot}/${server}/www",
    	group 	=> "${group}",
    	owner	=> "${user}",
	}
}

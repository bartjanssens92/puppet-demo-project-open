# This class manages the permissions for project open

define permissions (

	$group

) {

	exec { "chown":
                command => "/bin/chown -R projop:${group} /web/projop",
                require => Class ["packages"],
                creates => "/home/vagrant/.postgresqlOK.txt",
	}
	->
	file { "Giving the right permissions for /usr/src/aolserver folder":
                path    => "/usr/local/*",
                group   => $group,
                owner   => "projop",
        }

}

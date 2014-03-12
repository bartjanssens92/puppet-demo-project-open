# This class configures project open, this is done in the config.tcl file

define projectopen::projectopen_config (

	$address	= "0.0.0.0",
	$dbname		= "projop",
	$debug		= "true",
	$homedir	= "/usr/local",
	$hostname	= "hostname",
	$httpport	= "8000",
	$httpsport	= "8443",
	$server		= "projop",
	$servername	= "company",
	$serverroot	= "/web",

) {

	file { "${serverroot}/${server}/etc/config.tcl":
		path	=> "${serverroot}/${dbname}/etc/config.tcl",
		owner	=> root,
		group	=> root,
		content	=> template('projectopen/config.tcl.erb')
	}

}

# This class configures project open, this is done in the config.tcl file

define projectopen::projectopen_config (

	$httpport	= "8000",
	$httpsport	= "8443",
	$hostname	= "hostname",
	$address	= "0.0.0.0",
	$server		= "projop",
	$servername	= "$companyname project-open Server DEMO",
	$serverroot	= "/web",
	$homedir	= "/usr/local/aolserver451_rc2",

) {

	if $httpport != "8000" {
		file_line { "Setting the httpport to ${httpport}":
			path    => "${serverroot}/${server}/etc/config.tcl",
			line	=> "set httpport		${httpport}	# Managed by puppet",
			match	=> "[set]{3}\s[httpport]{8}\s*",
		}
	}

	if $httpsport != "8443" {
		file_line { "Setting the httpSport to ${httpsport}":
			path	=> "${serverroot}/${server}/etc/config.tcl",
			line	=> "set httpsport		${httpsport}	# Managed by puppet",
			match	=> "[set]{3}\s[httpsport]{9}\s*",
		}
	}

	if $hostname != "hostname" {
		file_line { "Setting the hostname to ${hostname}":
			path 	=> "${serverroot}/${server}/etc/config.tcl",
			line	=> "set hostname		[ns_info ${hostname}]	# Managed by puppet",
			match	=> "[set]{3}\s[hostname]{8}\t{2}\[",
		}
	}

	if $address != "0.0.0.0" {
		file_line { "Setting the address to ${address}":
			path	=> "${serverroot}/${server}/etc/config.tcl",
			line	=> "set address			${address}	# Managed by puppet",
			match	=> "[set]{3}\s[address]{7}\t{3}\"",
		}
	}


}

# This class installes a basic webserver

class basic_webserver {
	
	package { 'nginx':	ensure	=> 'present',
 	}

	package { 'ntp': 	ensure	=> 'present',
				require	=> Yumrepo['epel'],
	}
}

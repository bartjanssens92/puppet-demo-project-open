# This class gets all the packages needed for project open

class packages {

	case $::operatingsystem {
		centos, redhat: {
			if ! defined(Package['cvs']) { 
				package { 'cvs':		ensure	=> 'present', } 
			}

			if (!defined(Package['libXaw'])) {
				package { 'libXaw':		ensure	=> 'present', }
			}
	
			if ! defined(Package['']) {
				package { 'expat':		ensure	=> 'present', }
			}

		        if ! defined(Package['']) {
				package { 'expat-devel':	ensure	=> 'present', }
			}

		        if ! defined(Package['']) {
				package { 'pango':		ensure	=> 'present', }
        		}

			if ! defined(Package['']) {
				package { 'graphviz-devel':	ensure	=> 'present', }
        		}

			if ! defined(Package['']) {
				package { 'ImageMagick':	ensure 	=> 'present', }
			}

		        if ! defined(Package['']) {
				package { 'libdbi-dbd-pgsql':	ensure	=> 'present', }
        		}
	
			if ! defined(Package['']) {
				package { 'openldap-clients':	ensure	=> 'present', }
        		}
	
			if ! defined(Package['']) {
				package { 'openldap-devel':	ensure	=> 'present', }
       			}
	
			if ! defined(Package['']) {
				package	{ 'perl-YAML':		ensure	=> 'present', }
			}

		        if ! defined(Package['']) {
				package { 'libreoffice':	ensure	=> 'present', }
		        }
	
			if ! defined(Package['']) {
				package	{ 'libreoffice-headless':ensure	=> 'present', }
			}
	
		        if ! defined(Package['']) {
				package { 'curl':		ensure 	=> 'present',}
			}
		}	
	}
}

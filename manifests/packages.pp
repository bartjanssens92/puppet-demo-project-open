# This class gets all the packages needed for project open

class projectopen::packages {

	case $::operatingsystem {
		centos, redhat: {
			
			yumrepo {'epel':

			                name            => 'epel',
                			mirrorlist      => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=x86_64',
                			enabled         => 1,
                			gpgcheck        => 0,

        		}

			if ! defined(Package['vim-enhanced']) {
				 package { 'vim-enhanced': ensure  => 'present', require => Yumrepo['epel'], }
			}

			if ! defined(Package['man']) {
				package { 'man':		ensure	=> 'present',}
			}

			if ! defined(Package['lsof']) {
				package { 'lsof':		ensure	=> 'present', }
			}

			if ! defined(Package['ntp']) {
				package {'ntp':			ensure	=> 'present', }
			}
	
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

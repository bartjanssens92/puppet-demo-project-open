# This file configures the basic centos
# It will add the yumrepo epel and install some packages

class basic_config {
	
        yumrepo {'epel':

                name            => 'epel',
                mirrorlist      => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=x86_64',
                enabled         => 1,
                gpgcheck        => 0,

        }

	package { 'vim-enhanced':	ensure	=> 'present', 
					require	=> Yumrepo['epel'],
	}

	package { 'man':		ensure	=> 'present', }

	package { 'lsof':		ensure	=> 'present', }

	package { 'ruby.x86_64':	ensure	=> 'present', }
	
	package { 'unzip':		ensure 	=> 'present', }
}

# This class opens the specified port for postgres to lisen to

define projectopen::opening_ports (

	$port

) {

        file_line { "Opening Ports 22, 80, ${port}":
	        path    => '/etc/sysconfig/iptables',
	        line    => "-A INPUT -m state --state NEW -m tcp -p tcp -m multiport --dports 22,80,${port} -j ACCEPT",
	        match   => '\-[A]\s[A-Z]{5}\s\-[m]\s[a-z]{5}\s\-{2}[a-z]{5}\s[A-Z]{3}\s\-[m]\s[t,c,p]{3}\s\-[p]\s[t,p,c]{3}\s',
        }
        -> 
        service { " Restarting service iptabels":
                name	        => "iptables",
                restart	        => "service iptables restart",
                subscribe       => File_line["Opening Ports 22, 80, ${port}"],
        }

}

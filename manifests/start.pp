# This class makes the service file to start project open

class projectopen::start (

  $dbname      = undef,
  $group       = undef,
  $serverroot  = undef,
  $user        = undef,

) {

  file { '/etc/init.d/projectopen':
    path     => '/etc/init.d/projectopen',
    content  => template('projectopen/projectopen.erb'),
    mode     => '0755',
    #notify   => Service["projectopen"],
  }

#  service { "projectopen":
#    name     => "nds",
#    ensure   => true,
#    start    => "service projectopen start",
#    stop     => "service projectopen stop",
#    restart  => "service projectopen restart",
#  }

}

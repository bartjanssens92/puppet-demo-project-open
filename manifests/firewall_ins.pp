# This class manages the firewall with the firewall module

class projectopen::firewall_ins (

  $port   = undef,
  $sport  = undef,

) {
  resources { 'firewall':
    purge  => true,
  }

  class { ['projectopen::pre', 'projectopen::post']: }

  class { 'firewall': }

  firewall { '100 allow http and https access':
    port     => [22, 80, $port, $sport],
    proto    => tcp,
    action   => accept,
    before   => Class['projectopen::post'],
    require  => Class['projectopen::pre'],
  }
}
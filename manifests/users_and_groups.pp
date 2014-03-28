# This class manages the users and groups needed for projectopen

class projectopen::users_and_groups (

  $dbname      = undef,
  $group       = undef,
  $serverroot  = undef,
  $user        = undef,

)  {

  user { "Adding the user ${user} to group ${group}":
    ensure  => 'present',
    name    => $user,
    home    => "${serverroot}/${dbname}",
    groups  => $group,
  }
  ->
  file { 'Making the home folder':
    ensure  => directory,
    path    => $serverroot,
    owner   => $user,
    group   => $group,
  }
}
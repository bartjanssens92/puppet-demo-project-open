# This class manages the users and groups needed for projectopen

define projectopen::users_and_groups (

	$dbname,
	$group,
	$serverroot,
	$user

)  {

	group { "project open":
		name		=> $group,
		ensure		=> "present",
		provider	=> "groupadd",
	}
	->
	user { "Adding the user ${user} to group ${group}":
		name	=> "${user}",
		ensure	=> "present",
		home	=> "${serverroot}/${dbname}",
		groups	=> $group,
	}
	->
	file { "Making the home folder":
		path	=> "${serverroot}",
		ensure	=> directory,
		owner	=> "${user}",
		group	=> $group,
	}
	
}

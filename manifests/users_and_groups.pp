# This class manages the users and groups needed for projectopen

define users_and_groups (

	$group

) {

	group { "project open":
		name		=> $group,
		ensure		=> "present",
		provider	=> "groupadd",
	}
	->
	user { "Adding the user projop to group ${group}":
		name	=> "projop",
		ensure	=> "present",
		home	=> "/web/projop",
		groups	=> $group,
	}
	->
	file { "Making the home folder":
		path	=> "/web",
		ensure	=> directory,
		owner	=> "projop",
		group	=> $group,
	}
	
}

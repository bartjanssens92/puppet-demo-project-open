## DEMO project open

This module installes the demo-version off project open, currently only on a centos server.

**Warning** 
This module will create a new user "projop" , a new database called "projop" and a folder in the /home/"name"/ directory called "web".

## How to use

```puppet
	projectopen { 'Project Open':
		group		=> 'projop',
		password	=> 'projop',
		port		=> '8000',
		root		=> 'postgres',
	}
```
## Needed modules

### Archive

Git: https://github.com/camptocamp/puppet-archive.git

### Concat

Git: https://github.com/puppetlabs/puppetlabs-concat.git

### Postgresql

Git: https://github.com/puppetlabs/puppetlabs-postgresql.git

### Stdlib

Git: https://github.com/puppetlabs/puppetlabs-stdlib.git

## Explanation variables

### group

The group in which to add the user. If nonexisting, it will be created. The default value is projop.

### password

The password for the postgresql database that will be created.

### port

The port where project open will be lisening to. Default this will be 8000.

### root

The root user postgresql. This is to add the plpsql language to the database.

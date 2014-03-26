## DEMO project open

This module installes the demo-version off project open, currently only on a centos server.

## How to use

### Normal with default parameters

```puppet

	projectopen { 'Project-Open': }

```
### Custom with all parameters

These are the default parameters.

```puppet
	projectopen { 'Project Open':
		address			=> "0.0.0.0",
		companyname		=> "company",
		dbname			=> "projop",
		debug			=> "true",
		group			=> "projop",
		hostname		=> "hostname",
		httpport		=> "8000",
		httpsport		=> "8443",
		password		=> "projop",
		serverroot		=> "/web",
		superuser		=> "postgres",
		user			=> "projop",
	}
```
## Needed modules

### Concat

Git: https://github.com/puppetlabs/puppetlabs-concat.git

### Firewall

Git: https://github.com/puppetlabs/puppetlabs-firewall.git

### Postgresql

Git: https://github.com/puppetlabs/puppetlabs-postgresql.git

### Stdlib

Git: https://github.com/puppetlabs/puppetlabs-stdlib.git

## Explanation variables

### address

This sets the address for project open to run on.

### companyname

The name of the company that you are part off. Its not that important.

### dbname

The name of the database that project open is going to use. This is also the database that postgresql will make.

### debug

An option in the config.tcl file for setting the debug mode on or off, this by respectivly giving it the option true or false.

### group

The group in which to add the user. If nonexisting, it will be created. The default value is projop.

### hostname

The name of the host. Like the companyname, this is not that important.

### httpport

The port where project open will be listening on. 

### httpsport

See httpport.

### password

The password for the postgresql database that will be created.

### superuser

The root user off postgresql. This is to add the plpsql language to the database for project open.

### serverroot

The directory where all the projectopen files will be placed in.

### user

The user off the database on the machine.

## Project open REMOVE DOME VERSION

You can remove most of the demo data if you use an admin account. You need to go to: /admin/cleanup-demo/. This is the same as ADMIN-> ADMIN HOME -> scroll down till you see the area marked a Dangerous!! and click the first point. This allows to get rid off the demo data.

The other thing you will need to do is adapt the loginscreen, so that is doesnt show the users (and their passwords) anymore. You will need to edit the following file: $serverroot/dbname/www/index.adp and comment out (or delete) lines 45-72 and line 92. There is currently no other way to achive this.

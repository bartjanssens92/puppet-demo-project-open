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

### Archive

Git: https://github.com/camptocamp/puppet-archive.git

### Concat

Git: https://github.com/puppetlabs/puppetlabs-concat.git

## Firewall

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
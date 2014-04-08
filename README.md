# THERE IS NO MORE DEVELOPMENT ON THIS MODULE

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
		debug			=> false,
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

### Postgresql

Git: https://github.com/puppetlabs/puppetlabs-postgresql.git

### Stdlib

Git: https://github.com/puppetlabs/puppetlabs-stdlib.git

## Explanation variables

### address

The address should be set an to actual value. Setting the address to 0.0.0.0 means aolserver listens on all interfaces

### companyname

The name of the company.

### dbname

The name of the database that project open is going to use. This is also the database that postgresql will make.

### debug

Debug is turned on for demo servers. Please turn off for performance critical production installations.

### group

The group in which to add the user. If nonexisting, it will be created. The default value is projop.

### hostname

 The hostname should be set to  an actual value.

### httpport

Web server ports. Change to 80 and 443 for production use or use "Pound" as a reverse proxy. If setting httpport below 1024 then please read comments in file: /var/lib/aolserver/service0/packages/etc/daemontools/run

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

## Project open REMOVE DEMO VERSION

You can remove most of the demo data if you use an admin account. You need to go to: /admin/cleanup-demo/. This is the same as ADMIN-> ADMIN HOME -> scroll down till you see the area marked a Dangerous!! and click the first point. This allows to get rid off the demo data.

The other thing you will need to do is adapt the loginscreen, so that is doesnt show the users (and their passwords) anymore. You will need to edit the following file: $serverroot/dbname/www/index.adp and comment out (or delete) lines 45-72 and line 92. There is currently no other way to achive this.

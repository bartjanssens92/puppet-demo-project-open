# This class gets all the  packages needed for project open

class projectopen::packages {

  case $::operatingsystem {
    centos, redhat: {

      if ! defined(Package['projectopen-aolserver']) {
        package { 'projectopen-aolserver':
          ensure   => 'present',
        }
      }

      if ! defined(Package['projectopen-dbname']) {
        package { 'projectopen-dbname':
          ensure   => 'present',
        }
      }

      if ! defined(Package['cvs']) {
        package { 'cvs':  ensure  => 'present', }
      }

      if ! defined(Package['libXaw']) {
        package { 'libXaw':  ensure  => 'present', }
      }

      if ! defined(Package['expat']) {
        package { 'expat':  ensure  => 'present', }
      }

      if ! defined(Package['expat-devel']) {
        package { 'expat-devel':  ensure  => 'present', }
      }

      if ! defined(Package['pango']) {
        package { 'pango':    ensure  => 'present', }
      }

      if ! defined(Package['graphviz-devel']) {
        package { 'graphviz-devel':  ensure  => 'present', }
      }

      if ! defined(Package['ImageMagick']) {
        package { 'ImageMagick':  ensure  => 'present', }
      }

      if ! defined(Package['libdbi-dbd-pgsql']) {
        package { 'libdbi-dbd-pgsql':  ensure  => 'present', }
      }

      if ! defined(Package['openldap-clients']) {
        package { 'openldap-clients':  ensure  => 'present', }
      }

      if ! defined(Package['openldap-devel']) {
        package { 'openldap-devel':  ensure  => 'present', }
      }

      if ! defined(Package['perl-YAML']) {
        package { 'perl-YAML':  ensure  => 'present', }
      }

      if ! defined(Package['libreoffice']) {
        package { 'libreoffice':  ensure  => 'present', }
      }

      if ! defined(Package['libreoffice-headless']) {
        package  { 'libreoffice-headless':  ensure  => 'present', }
      }
    }

    debian: {

      if ! defined(Package['git-core']) {
        package { 'git-core':  ensure  => 'present' }
      }

      if ! defined(Package['emacs']) {
        package { 'emacs':  ensure  => 'present', }
      }

      if ! defined(Package['unzip']) {
        package { 'unzip':  ensure  => 'present', }
      }

      if ! defined(Package['zip']) {
        package { 'zip':  ensure  => 'present', }
      }

      if ! defined(Package['make']) {
        package { 'make':  ensure  => 'present', }
      }

      if ! defined(Package['wwwconfig-common']) {
        package { 'wwwconfig-common':  ensure  => 'present', }
      }

      if ! defined(Package['nginx']) {
        package { 'nginx':  ensure  => 'present', }
      }

      if ! defined(Package['jodconverter']) {
        package { 'jodconverter':  ensure  => 'present', }
      }

      if ! defined(Package['ldap-utils']) {
        package { 'ldap-utils':  ensure  => 'present', }
      }

      if ! defined(Package['tcl']) {
        package { 'tcl':  ensure  => 'present', }
      }

      if ! defined(Package['tcl8.4']) {
        package { 'tcl8.4':  ensure  => 'present', }
      }

      if ! defined(Package['cllib']) {
        package { 'cllib':  ensure  => 'present', }
      }

      if ! defined(Package['tclthread']) {
        package { 'tclthread':  ensure  => 'present', }
      }

      if ! defined(Package['tdom']) {
        package { 'tdom':  ensure  => 'present', }
      }

      if ! defined(Package['xotcl']) {
        package { 'xotcl':  ensure  => 'present', }
      }

      if ! defined(Package['aolserver4-core']) {
        package { 'aolserver4-core':  ensure  => 'present', }
      }

      if ! defined(Package['aolserver4-daemon']) {
        package { 'aolserver4-daemon':  ensure  => 'present', }
      }

      if ! defined(Package['aolserver4-doc']) {
        package { 'aolserver4-doc':  ensure  => 'present', }
      }

      if ! defined(Package['aolserver4-nspostgres']) {
        package { 'aolserver4-nspostgres':  ensure  => 'present', }
      }

      if ! defined(Package['aolserver4-nssha1']) {
        package { 'aolserver4-nssha1':  ensure  => 'present', }
      }

      if ! defined(Package['aolserver4-xotcl']) {
        package { 'aolserver4-xotcl':  ensure  => 'present', }
      }

      if ! defined(Package['aolserver4-dev']) {
        package { 'aolserver4-dev':  ensure  => 'present', }
      }

      if ! defined(Package['libdjvulibre-text']) {
        package { 'libdjvulibre-text':  ensure  => 'present', }
      }

      if ! defined(Package['libdjvulibre21']) {
        package { 'libdjvulibre21':  ensure  => 'present', }
      }

      if ! defined(Package['libgomp1']) {
        package { 'libgomp1':  ensure  => 'present', }
      }

      if ! defined(Package['libilmbase6']) {
        package { 'libilmbase6':  ensure  => 'present', }
      }

      if ! defined(Package['liblcms1']) {
        package { 'liblcms1':  ensure  => 'present', }
      }

      if ! defined(Package['libltdl7']) {
        package { 'libltdl7':  ensure  => 'present', }
      }

      if ! defined(Package['libopenexr6']) {
        package { 'libopenexr6':  ensure  => 'present', }
      }

      if ! defined(Package['libpaper-utils']) {
        package { 'libpaper-utils':  ensure  => 'present', }
      }

      if ! defined(Package['libpaper1']) {
        package { 'libpaper1':  ensure  => 'present', }
      }

      if ! defined(Package['libpq5']) {
        package { 'libpq5':  ensure  => 'present', }
      }

      if ! defined(Package['libwmf0']) {
        package { 'libwmf0.2-7':  ensure  => 'present', }
      }

      if ! defined(Package['daemontools']) {
        package { 'daemontools':  ensure  => 'present', }
      }

      if ! defined(Package['daemontools-run']) {
        package { 'daemontools-run':  ensure  => 'present', }
      }

      if ! defined(Package['ghostscript']) {
        package { 'ghostscript':  ensure  => 'present', }
      }

      if ! defined(Package['gsfonts']) {
        package { 'gsfonts':  ensure  => 'present', }
      }

      if ! defined(Package['psfontmgr']) {
        package { 'psfontmgr':  ensure  => 'present', }
      }

      if ! defined(Package['imagemagick']) {
        package { 'imagemagick':  ensure  => 'present', }
      }

      if ! defined(Package['graphviz']) {
        package { 'graphviz':  ensure  => 'present', }
      }

      if ! defined(Package['libcupsimage2']) {
        package { 'libcupsimage2':  ensure  => 'present', }
      }

      if ! defined(Package['libreoffice-writer']) {
        package { 'libreoffice-writer':  ensure  => 'present', }
      }

      if ! defined(Package['libreoffice-draw']) {
        package { 'libreoffice-draw':  ensure  => 'present', }
      }

      if ! defined(Package['libreoffice-java-common']) {
        package { 'libreoffice-java-common':  ensure  => 'present', }
      }

    }

    default: {

      fail("Unsupported operatingsystem: ${::operatingsystem}")

    }
  }
}

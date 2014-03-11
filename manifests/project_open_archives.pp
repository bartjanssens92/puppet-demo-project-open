# This class gets the needed archives for project open

define projectopen::project_open_archives {

        archive { 'web_projop-aux-files.4.0.4.0.0':
                ensure                  => 'present',
                url                     => 'http://sourceforge.net/projects/project-open/files/project-open/Support%20Files/web_projop-aux-files.4.0.4.0.0.tgz',
                extension               => 'tgz',
                target                  => "/web/projop",
                follow_redirects        => true,
                checksum                => false,
        }
        ->
        archive { 'project-open-Update-4.0.4.0.0':
                ensure                  => 'present',
                url                     => 'http://sourceforge.net/projects/project-open/files/project-open/V4.0/project-open-Update-4.0.4.0.0.tgz',
                extension               => 'tgz',
                target                  => "/web/projop",
                follow_redirects        => true,
                checksum                => false,
        }
        ->
        archive { 'aolserver451rc2-po2.nsreturnz.el6.x86_64':
                ensure                  => 'present',
                url                     => 'http://sourceforge.net/projects/project-open/files/project-open/Support%20Files/aolserver451rc2-po2.nsreturnz.el6.x86_64.tgz',
                extension               => 'tgz',
                target                  => '/usr/local/',
                follow_redirects        => true,
                checksum                => false,
        }
} 

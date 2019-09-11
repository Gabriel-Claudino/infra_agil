class docker{
        case $osfamily{
                "debian":{
                        $pacotes = ['apt-transport-https','ca-certificates','curl','gnupg-agent','software-properties-common']
                        
			exec{"apt_update":
                                command => "/usr/bin/apt update"
                        }

			exec{"docker_repo":
                                command => "/usr/bin/apt update"
                        }

			exec{'debian_repository':
               		command => '/usr/bin/add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"',
			onlyif => '/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -',
			notify => Exec['apt_update'],
			require => Package[$pacotes]
			}


        	}			
       }
	
       package{$pacotes:
		ensure => present,
		before => Package['docker-ce']
	}
	
	package{'docker-ce':
		ensure => present,
		before => Service['docker']
	}

	service{'docker':
		ensure => running,
		enable => true,
		subscribe => Package['docker-ce']
	}

}

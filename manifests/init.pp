class headphones inherits headphones::params {
	include headphones::config
    include headphones::proxy
    include git
    include python::virtualenv
    include supervisor
	
#	user { "$services_user":
#        allowdupe => false,
#        ensure => 'present',
#    }

    file { "$base_dir/headphones":
        ensure => directory,
        owner => "$services_user",
        group => "$services_user",
        mode => '0644',
    }
    exec { 'venv-create-headphones':
        command => "virtualenv $venv_dir",
        cwd => "$base_dir/headphones",
        creates => "$base_dir/headphones/$venv_dir/bin/activate",
        path => '/usr/bin/',
        require => Class['python::virtualenv'];
    }
    exec { 'download-headphones':
        command => "/usr/bin/git clone $url src",
        cwd     => "$base_dir/headphones",
        creates => "$base_dir/headphones/src",
        require => Class['git'],
    }
    supervisor::service {
        'headphones':
            ensure => present,
            enable => true,
            stdout_logfile => "$base_dir/headphones/log/supervisor.log",
            stderr_logfile => "$base_dir/headphones/log/supervisor.log",
            command => "$base_dir/headphones/venv/bin/python $base_dir/headphones/src/Headphones.py --datadir $base_dir/headphones/data --config $base_dir/headphones/config.ini",
            user => "$services_user",
            group => "$services_user",
            directory => "$base_dir/headphones/src/",
            require => Exec['download-headphones'],
    }
}

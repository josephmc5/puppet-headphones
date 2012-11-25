class headphones::config {
    if $logrotate {
        logrotate::rule { 'headphones':
            path          => "$log_dir/*",
            rotate        => 5,
            size          => '100k',
            sharedscripts => true,
            postrotate    => '/usr/bin/supervisorctl restart headphones',
        }   
    }
    file { "$log_dir":
        ensure => directory,
        owner => "$services_user",
        group => "$services_user",
        mode => '0644',
    }
    file { "$base_dir/headphones/config/":
        ensure => directory,
        owner => "$services_user",
        group => "$services_user",
    }
    file { "$base_dir/headphones/data/":
        ensure => directory,
        owner => "$services_user",
        group => "$services_user",
    }
    file { "$base_dir/headphones/config.ini":
        content => template('headphones/config.ini.erb'),
        owner => "$services_user",
        group => "$services_user",
        mode => '0644',
        require => File["$base_dir/headphones/config/"],
        notify => Service['supervisor::headphones'],
    }
}

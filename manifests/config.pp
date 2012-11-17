class headphones::config {
    file { "$base_dir/headphones/config/":
        ensure => directory,
        owner => 'headphones',
        group => 'headphones',
    }
    file { "$base_dir/headphones/data/":
        ensure => directory,
        owner => 'headphones',
        group => 'headphones',
    }
    file { "$base_dir/headphones/config.ini":
        content => template('headphones/config.ini.erb'),
        owner => 'headphones',
        group => 'headphones',
        mode => '0644',
        require => File["$base_dir/headphones/config/"],
        notify => Service['supervisor::headphones'],
    }
    
    file { "$log_dir":
        ensure => directory,
        owner => 'headphones',
        group => 'headphones',
        mode => '0644',
    }
}

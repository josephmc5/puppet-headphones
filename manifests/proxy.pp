class headphones::proxy inherits headphones::params {
    if $proxy_nginx {
        include nginx
        nginx::resource::upstream { 'headphones':
            ensure  => present,
            members => "$headphones_host:$headphones_port",
        }
        nginx::resource::location { 'headphones':
            ensure   => present,
            proxy  => 'http://headphones',
            location => "$headphones_webroot",
            vhost    => "$external_dns",
        }
    }
}

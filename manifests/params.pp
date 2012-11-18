class headphones::params (
    $api_key = hiera("headphones_api_key"),
    $headphones_host = hiera("headphones_host", "localhost"),
    $headphones_port = hiera("headphones_port", "8083"),
    $headphones_webroot = hiera("headphones_webroot", "/music"),
    $sabnzbd_api_key = hiera("sabnzbd_nzb_key"),
    $nzb_server_ssl = hiera("nzb_server_ssl", "1"),
    $nzbmatrix_username = hiera("nzbmatrix_username", ""),
    $nzbmatrix_apikey = hiera("nzbmatrix_apikey", ""),
    $base_dir = hiera("app_dir", "/opt"),
    $sabnzbd_host = hiera("sabnzbd_host", "localhost"),
    $sabnzbd_port = hiera("sabnzbd_port", "8080"),
    $sabnzbd_webroot = hiera("sabnzbd_webroot", "/sabnzbd"),
    $complete_music_download_dir = hiera("complete_music_download_dir", "music"),
    $music_dir = hiera("music_dir"),
    $external_dns = hiera("external_dns", "localhost"),
    $musicbrainz_mirror = hiera("musicbrainz_mirror", "headphones"),
    $musicbrainz_user = hiera("musicbrainz_user"),
    $musicbrainz_passwd = hiera("musicbrainz_passwd"),
    $venv_dir = "venv",
    $url = hiera("headphones_git_url", "git://github.com/rembo10/headphones.git"),
    $proxy_nginx = hiera("proxy_nginx", "false"),
    $proxy_apache = hiera("proxy_apache", "false"),
    $logrotate = hiera("logrotate", "false"),
)
{
    $log_dir = "$base_dir/headphones/log"
    $data_dir = "$base_dir/headphones/data"
    $cache_dir = "$base_dir/headphones/cache"
}

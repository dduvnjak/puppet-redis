class redis::config {

  Class['redis::config'] -> Redis::Instance <| |>

  exec { 'redis_cleanup':
    command => 'stop redis-server; rm -rf /etc/init/redis-server.conf /etc/redis/redis.conf /var/log/redis/redis.log /var/lib/redis',
    onlyif  => 'test -f /etc/init/redis-server.conf',
    path    => [ "/sbin/", "/usr/bin" ],
  }

}

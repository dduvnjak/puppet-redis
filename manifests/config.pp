class redis::config {

  service { 'redis-server':
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }

  file { '/etc/redis/redis.conf':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('redis/redis.conf.erb'),
    notify  => Service['redis-server'],
  }

}

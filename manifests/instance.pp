# == Define: redis::instance
#
# Manages Redis instance.
#
# === Parameters
#
# [*bind_local*]
#  Listen on localhost only. Default: false
#
# [*port*]
#  Port to listen on. Default: same as instance name
#
# [*slave_of*]
#  Enable replication from master. Default: false
#
# [*slave_of_port*]
#  Master port. Default: same as instance name
#
# [*slave_priority*]
#  Slave priority. Default: 100
#
# === Examples
#
# class { 'redis':
#   bind_local     => false,
#   port           => '6379',
#   slave_of       => 'redismaster01.example.com',
#   slave_of_port  => '6379',
#   slave_priority => '200',
# }
#
# === Authors
#
# Sergey Stankevich
#
define redis::instance (
  $bind_local     = false,
  $port           = $name,
  $slave_of       = false,
  $slave_of_port  = $name,
  $slave_priority = '100',
) {

  File["/etc/init/redis-${name}.conf"]  -> Service["redis-${name}"]
  File["/etc/init/redis-${name}.conf"]  ~> Service["redis-${name}"]
  File["/etc/redis/redis-${name}.conf"] ~> Service["redis-${name}"]

  file { "/etc/init/redis-${name}.conf":
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('redis/init.conf.erb'),
  }

  service { "redis-${name}":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  file { "/etc/redis/redis-${name}.conf":
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('redis/redis.conf.erb'),
  }

}

# == Class: redis
#
# Installs and manages Redis.
#
# === Notes
#
# Module uses Dotdeb (http://www.dotdeb.org/instructions/) Redis packages.
#
# === Parameters
#
# [*bind_local*]
#  Listen on localhost only. Default: true
#
# [*slaveof*]
#  Enable replication from master. Default: false
#
# === Examples
#
# class { 'redis':
#   bind_local => false,
#   slaveof    => 'redismaster01.example.com',
# }
#
# === Authors
#
# Sergey Stankevich
#
class redis (
  $bind_local = true,
  $slaveof    = false
) {

  # Compatibility check
  $compatible = [ 'Debian', 'Ubuntu' ]
  if ! ($::operatingsystem in $compatible) {
    fail("Module is not compatible with ${::operatingsystem}")
  }

  Class['redis::install'] -> Class['redis::config']

  include redis::install
  include redis::config

}

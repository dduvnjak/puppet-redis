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
# [*slave_of*]
#  Enable replication from master. Default: false
#
# [*slave_priority*]
#  Slave priority. Default: 100
#
# === Examples
#
# class { 'redis':
#   bind_local     => false,
#   slave_of       => 'redismaster01.example.com',
#   slave_priority => '200',
# }
#
# === Authors
#
# Sergey Stankevich
#
class redis (
  $bind_local     = true,
  $slave_of       = false,
  $slave_priority = '100'
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

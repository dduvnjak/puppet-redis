# == Class: redis
#
# Installs and manages Redis.
#
# === Examples
#
# include redis
#
# === Authors
#
# Sergey Stankevich
#
class redis {

  # Compatibility check
  $compatible = [ 'Ubuntu' ]
  if ! ($::operatingsystem in $compatible) {
    fail("Module is not compatible with ${::operatingsystem}")
  }

  Class['redis::install'] -> Class['redis::config']

  include redis::install
  include redis::config

}

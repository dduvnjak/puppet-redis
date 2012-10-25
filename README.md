[puppet-redis](https://github.com/stankevich/puppet-redis)
======

Puppet module for installing and managing Redis.

## Usage

### redis

Installs and manages Redis.

**bind_local** — Listen on localhost only. Default: true

**slave_of** — Enable replication from master. Default: false

**slave_priority** — Slave priority. Default: 100

	class { 'redis':
	  bind_local     => false,
	  slave_of       => 'redismaster01.example.com',
	  slave_priority => '200',
	}

## Authors

[Sergey Stankevich](https://github.com/stankevich)

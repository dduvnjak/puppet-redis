[puppet-redis](https://github.com/stankevich/puppet-redis)
======

Puppet module for installing and managing Redis.

## Usage

### redis

Installs and manages Redis.

**bind_local** — Listen on localhost only. Default: true

**slaveof** — Enable replication from master. Default: false

	class { 'redis':
	  bind_local => false,
	  slaveof    => 'redismaster01.example.com',
	}

## Authors

[Sergey Stankevich](https://github.com/stankevich)

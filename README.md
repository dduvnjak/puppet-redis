[puppet-redis](https://github.com/stankevich/puppet-redis)
======

Puppet module for installing and managing Redis.

## Usage

### redis

Installs and manages Redis.

	include redis

### redis::instance

Manages Redis instance.

**bind_local** — Listen on localhost only. Default: false

**port** — Port to listen on. Default: same as instance name

**slave_of** — Enable replication from master. Default: false

**slave_of_port** — Master port. Default: same as instance name

**slave_priority** — Slave priority. Default: 100

	class { 'redis':
	  bind_local     => false,
	  port           => '6379',
	  slave_of       => 'redismaster01.example.com',
	  slave_of_port  => '6379',
	  slave_priority => '200',
	}

## Authors

[Sergey Stankevich](https://github.com/stankevich)

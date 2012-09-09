class { 'redis':
  bind_local => false,
  slaveof    => 'redismaster01.example.com',
}

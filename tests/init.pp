class { 'redis':
  bind_local     => false,
  slave_of       => 'redismaster01.example.com',
  slave_priority => '200',
}

class { 'redis':
  bind_local     => false,
  port           => '6379',
  slave_of       => 'redismaster01.example.com',
  slave_of_port  => '6379',
  slave_priority => '200',
}

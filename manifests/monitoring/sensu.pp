class redis::monitoring::sensu {

  sensu::check { 'redis-metrics':
    type        => 'metric',
    handlers    => 'graphite',
    command     => '/etc/sensu/plugins/redis-metrics.rb -h localhost -p 6379',
    interval    => 30,
  }

  sensu::subscription { 'redis': }

}

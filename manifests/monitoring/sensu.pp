# == Class: redis::monitoring::sensu
#
# This class writes out the redis config file
#
#
# === Parameters
#
# See the init.pp for parameter information.  This class should not be direclty called.
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class redis::monitoring::sensu {

  sensu::check { 'redis-metrics':
    type        => 'metric',
    handlers    => 'graphite',
    command     => '/etc/sensu/plugins/redis-metrics.rb -h localhost -p 6379',
    interval    => 30,
  }

  sensu::subscription { 'redis': }

}

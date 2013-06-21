# == Class: redis::config
#
# This class writes out the redis config file
#
#
# === Parameters
#
# See the init.pp for parameter information. Don't call this class directly.
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class redis::config (
  $port,
  $listen,
  $unixsocket,
  $redis_loglevel,
  $databases,
  $save,
  $masterip,
  $masterport,
  $masterauth,
  $requirepass,
  $maxclients,
  $maxmemory,
  $maxmemory_policy,
  $appendonly,
  $appendfsync,
  $auto_aof_rewrite_percentage,
  $auto_aof_rewrite_min_size,
  $slowlog_log_slower_than,
  $slowlog_max_len,
  $version
) {

  $redis_file = $::osfamily? {
    'Debian'  => '/etc/redis/redis.conf',
    default   => '/etc/redis.conf'
  }

  # use vm. options only if 2.0-2.2 specified
  $vm_options = $version? {
    /^2\.[0-2]/ => true,
    default     => false,
  }

  file { $redis_file:
    ensure  => file,
    owner   => 'redis',
    group   => 'redis',
    mode    => '0444',
    content => template('redis/redis.conf.erb'),
  }

}

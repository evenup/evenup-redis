# == Class: redis::config
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
class redis::config (
  $port                        = $::redis::port,
  $listen                      = $::redis::listen,
  $unixsocket                  = $::redis::unixsocket,
  $redis_loglevel              = $::redis::redis_loglevel,
  $databases                   = $::redis::databases,
  $save                        = $::redis::save,
  $masterip                    = $::redis::masterip,
  $masterport                  = $::redis::masterport,
  $masterauth                  = $::redis::masterauth,
  $requirepass                 = $::redis::requirepass,
  $maxclients                  = $::redis::maxclients,
  $maxmemory                   = $::redis::maxmemory,
  $maxmemory_policy            = $::redis::maxmemory_policy,
  $appendonly                  = $::redis::appendonly,
  $appendfsync                 = $::redis::appendfsync,
  $auto_aof_rewrite_percentage = $::redis::auto_aof_rewrite_percentage,
  $auto_aof_rewrite_min_size   = $::redis::auto_aof_rewrite_min_size,
  $slowlog_log_slower_than     = $::redis::slowlog_log_slower_than,
  $slowlog_max_len             = $::redis::slowlog_max_len,
) {

  file { '/etc/redis.conf':
    ensure  => file,
    owner   => 'redis',
    group   => 'redis',
    mode    => '0444',
    content => template('redis/redis.conf.erb'),
  }

}
# == Class: redis::service
#
# This class manages the redis service
#
#
# === Parameters
#
# See the init.pp for parameter information. Don't call this class directly.
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class redis::service (
  $monitoring = 'none',
) {

  $redis_service = $::osfamily? {
    'Debian'  => 'redis-server',
    default   => 'redis'
  }

  service {
    $redis_service:
      ensure  => running,
      enable  => true,
      require => Package[$redis_service],
  }

  case $monitoring {
    'sensu':  { include redis::monitoring::sensu }
    default:  { notice 'No monitoring included' }
  }

}

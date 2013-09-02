# == Class: redis::service
#
# This class manages the redis service
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
class redis::service (
  $monitoring,
) {

  service {
    'redis':
      ensure  => running,
      enable  => true,
      require => Package['redis'],
  }

  case $monitoring {
    'sensu':  { include redis::monitoring::sensu }
    default:  {}
  }

}

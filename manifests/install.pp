# == Class: redis::install
#
# This class installs the redis package
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
class redis::install ( $version = 'latest' ) {

  $redis_package = $::osfamily? {
    'Debian'  => 'redis-server',
    default   => 'redis'
  }

  package {
    $redis_package:
      ensure => $version,
  }
}
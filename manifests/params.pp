# Class: carbon::params
#
# This class defines default parameters used by the main module class carbon
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to carbon class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class carbon::params {
  # ## Application related parameters

  $package = $::operatingsystem ? {
    default => 'graphite-carbon',
  }

  $service = $::operatingsystem ? {
    default => 'carbon-cache',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'carbon-cache',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => '_graphite',
  }

  $process_group = $::operatingsystem ? {
    default => '_graphite',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/carbon',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/carbon/carbon.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/graphite-carbon',
    default                   => '/etc/sysconfig/graphite-carbon',
  }

  $config_file_init_template = 'carbon/debian_service_config.erb'

  $pid_file = $::operatingsystem ? {
    default => '/var/run/carbon.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/graphite',
  }

  $whisper_dir = $::operatingsystem ? {
    default => '/var/lib/graphite/whisper',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/carbon',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/carbon/carbon.log',
  }

  $port = 2003
  $pickle_receiver_port = 2004
  $cache_query_port = 7002
  $protocol = 'tcp'
  $max_cache_size = 'inf'
  $max_updates_per_second = 500
  $max_creates_per_minute = 50
  $carbon_metric_prefix = 'carbon'
  $carbon_metric_interval = 60

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = 'carbon/carbon.conf.erb'
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  # ## General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}

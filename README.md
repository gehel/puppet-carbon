# Puppet module: carbon

This is a Puppet module for carbon based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Official git repository: http://github.com/gehel/puppet-carbon

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install carbon with default settings

        class { 'carbon': }

* Install a specific version of carbon package

        class { 'carbon':
          version => '1.0.1',
        }

* Disable carbon service.

        class { 'carbon':
          disable => true
        }

* Remove carbon package

        class { 'carbon':
          absent => true
        }

* Enable auditing without without making changes on existing carbon configuration *files*

        class { 'carbon':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'carbon':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'carbon':
          source => [ "puppet:///modules/example42/carbon/carbon.conf-${hostname}" , "puppet:///modules/example42/carbon/carbon.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'carbon':
          source_dir       => 'puppet:///modules/example42/carbon/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'carbon':
          template => 'example42/carbon/carbon.conf.erb',
        }

* Automatically include a custom subclass

        class { 'carbon':
          my_class => 'example42::my_carbon',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'carbon':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'carbon':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'carbon':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'carbon':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


## CONTINUOUS TESTING

Travis [![Build Status](https://travis-ci.org/gehel/puppet-carbon.png?branch=master)](https://travis-ci.org/gehel/puppet-carbon)

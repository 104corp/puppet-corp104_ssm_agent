class corp104_ssm_agent::service inherits corp104_ssm_agent {
  if $corp104_ssm_agent::manage_service and $facts['ec2_metadata'] {
    case $facts['osfamily'] {
      'Debian': {
        service { $corp104_ssm_agent::service_name:
          ensure    => running,
          subscribe => Package['ssm_agent'],
          require   => Class['corp104_ssm_agent::install'],
        }
      }
      'RedHat': {
        service { $corp104_ssm_agent::service_name:
          ensure    => running,
          subscribe => Package['ssm_agent'],
          require   => Class['corp104_ssm_agent::install'],
        }
      }
      default: {
        service { $corp104_ssm_agent::service_name:
          ensure     => running,
          hasstatus  => true,
          hasrestart => true,
          restart    => "/sbin/restart ${corp104_ssm_agent::service_name}",
          start      => "/sbin/start ${corp104_ssm_agent::service_name}",
          status     => "/sbin/status ${corp104_ssm_agent::service_name}",
          stop       => "/sbin/stop ${corp104_ssm_agent::service_name}",
          subscribe  => Package['ssm_agent'],
          require    => Class['corp104_ssm_agent::install'],
        }
      }
    }
  }
}

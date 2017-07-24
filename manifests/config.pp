class corp104_ssm_agent::config inherits corp104_ssm_agent {
  File {
    owner   => 'root',
    group   => 'root',
    require => Class['corp104_ssm_agent::install'],
    notify  => Class['corp104_ssm_agent::service'],
  }

  if $corp104_ssm_agent::http_proxy or $corp104_ssm_agent::no_proxy {
    file { $corp104_ssm_agent::systemd_file:
      ensure  => file,
      content => template("${module_name}/amazon-ssm-agent.conf.erb"),
    }
  }
}
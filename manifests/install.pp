class corp104_ssm_agent::install inherits corp104_ssm_agent {
  if $corp104_ssm_agent::proxy_install_manage {
    exec { 'download_ssm-agent':
      command => "curl -x ${corp104_ssm_agent::http_proxy} --connect-timeout ${corp104_ssm_agent::proxy_install_manage_timeout} -o ${corp104_ssm_agent::ssm_tmp_file} -O ${corp104_ssm_agent::ssm_agent_download_url}",
      path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      creates => $corp104_ssm_agent::ssm_tmp_file
    }
  }
  else {
    exec { 'download_ssm-agent':
      command => "curl -o ${corp104_ssm_agent::ssm_tmp_file} --connect-timeout ${corp104_ssm_agent::proxy_install_manage_timeout} -O ${corp104_ssm_agent::ssm_agent_download_url}",
      path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      creates => $corp104_ssm_agent::ssm_tmp_file
    }
  }

  package { 'ssm_agent':
    ensure    => 'installed',
    name      => $corp104_ssm_agent::package_name,
    provider  => $corp104_ssm_agent::package_provider,
    source    => $corp104_ssm_agent::ssm_tmp_file,
    subscribe => Exec['download_ssm-agent'],
  }
}
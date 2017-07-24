class { '::corp104_ssm_agent':
  http_proxy => 'http://proxy.com:3128',
  no_proxy   => '169.254.169.254',
}

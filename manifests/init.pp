# Class: corp104_ssm_agent
# ===========================
#
# Full description of class corp104_ssm_agent here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'corp104_ssm_agent':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class corp104_ssm_agent (
  String $osver,
  String $ssm_tmp_file,
  String $package_provider,
  String $package_type,
  String $package_name,
  String $systemd_file,
  String $ssm_agent_download_url,
  Boolean $manage_service,
  String $service_name,
  Boolean $proxy_install_manage,
  String $proxy_install_manage_timeout,
  Optional[String] $http_proxy,
  Optional[String] $no_proxy,
){
  contain corp104_ssm_agent::install
  contain corp104_ssm_agent::config
  contain corp104_ssm_agent::service

  Class['::corp104_ssm_agent::install']
  -> Class['::corp104_ssm_agent::config']
  ~> Class['::corp104_ssm_agent::service']
}

class puppetlabs_yum (
  $url_prefix                          = $puppetlabs_yum::params::url_prefix,
  $puppetlabs_gpgkey                   = $puppetlabs_yum::params::puppetlabs_gpgkey,
  $install_puppet3_repo                = $puppetlabs_yum::params::install_puppet3_repo,
  $install_pc1_repo                    = $puppetlabs_yum::params::install_pc1_repo,
  $enable_source_repos                 = $puppetlabs_yum::params::enable_source_repos,
  $enable_devel_repo                   = $puppetlabs_yum::params::enable_devel_repo,

  ) inherits ::puppetlabs_yum::params {
  validate_string($url_prefix)
  validate_string($puppetlabs_gpgkey)
  validate_bool($install_puppet3_repo)
  validate_bool($install_pc1_repo)
  validate_bool($enable_source_repos)
  validate_bool($enable_devel_repo)

  if $install_puppet3_repo {
    include ::puppetlabs_yum::puppet3
  }

  if $install_pc1_repo {
    include ::puppetlabs_yum::pc1
  }
}

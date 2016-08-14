class puppetlabs_yum (
  $url_prefix                          = $puppetlabs_yum::params::url_prefix,
  $puppetlabs_gpgkey                   = $puppetlabs_yum::params::puppetlabs_gpgkey,
  $puppet3_repo_install                = $puppetlabs_yum::params::puppet3_repo_install,
  $pc1_repo_install                    = $puppetlabs_yum::params::pc1_repo_install,
  $puppet3_products_enabled            = $puppetlabs_yum::params::puppet3_products_enabled,
  $puppet3_products_source_enabled     = $puppetlabs_yum::params::puppet3_products_source_enabled,
  $puppet3_dependencies_enabled        = $puppetlabs_yum::params::puppet3_dependencies_enabled,
  $puppet3_dependencies_source_enabled = $puppetlabs_yum::params::puppet3_dependencies_source_enabled,
  $puppet3_devel_enabled               = $puppetlabs_yum::params::puppet3_devel_enabled,
  $puppet3_devel_source_enabled        = $puppetlabs_yum::params::puppet3_devel_source_enabled,
  $pc1_enabled                         = $puppetlabs_yum::params::pc1_enabled,
  $pc1_source_enabled                  = $puppetlabs_yum::params::pc1_source_enabled,
) inherits ::puppetlabs_yum::params {
  validate_string($url_prefix)
  validate_string($puppetlabs_gpgkey)
  validate_bool($puppet3_repo_install)
  validate_bool($pc1_repo_install)
  validate_bool($puppet3_products_enabled)
  validate_bool($puppet3_products_source_enabled)
  validate_bool($puppet3_dependencies_enabled)
  validate_bool($puppet3_dependencies_source_enabled)
  validate_bool($puppet3_devel_enabled)
  validate_bool($puppet3_devel_source_enabled)
  validate_bool($pc1_enabled)
  validate_bool($pc1_source_enabled)

  if $puppet3_repo_install {
    include ::puppetlabs_yum::puppet3
  }

  if $pc1_repo_install {
    include ::puppetlabs_yum::pc1
  }
}

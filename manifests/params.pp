class puppetlabs_yum::params {
  $url_prefix                          = 'https://yum.puppetlabs.com'
  $puppetlabs_gpgkey                   = 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs'
  $puppet3_repo_install                = false
  $pc1_repo_install                    = true

  # 'products' and 'dependencies' are used for puppet 3.x. 'devel' has
  # development releases of puppet 3.x before they get marked as stable and
  # moved to the normal 'products' repo.
  $puppet3_products_enabled            = true
  $puppet3_products_source_enabled     = false
  $puppet3_dependencies_enabled        = true
  $puppet3_dependencies_source_enabled = false
  $puppet3_devel_enabled               = false
  $puppet3_devel_source_enabled        = false

  $pc1_enabled                         = true
  $pc1_source_enabled                  = false

  $os_url = $::operatingsystem ? {
    'Fedora' => "fedora/f${::operatingsystemmajrelease}",
    default  => "el/${::operatingsystemmajrelease}",
  }
}

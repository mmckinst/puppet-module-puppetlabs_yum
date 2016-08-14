class puppetlabs_yum::params {
  $url_prefix                          = 'https://yum.puppetlabs.com'
  $puppetlabs_gpgkey                   = 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs'
  $install_puppet3_repo                = false
  $install_pc1_repo                    = true
  $enable_source_repos                 = false
  $enable_devel_repo                   = false
  $os_url = $::operatingsystem ? {
    'Fedora' => "fedora/f${::operatingsystemmajrelease}",
    default  => "el/${::operatingsystemmajrelease}",
  }
}

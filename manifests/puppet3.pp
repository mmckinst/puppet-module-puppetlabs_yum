class puppetlabs_yum::puppet3 inherits puppetlabs_yum {
  yumrepo { 'puppetlabs-products':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/products/${::architecture}",
    descr    => "Puppet Labs Products ${::operatingsystem} ${::operatingsystemmajrelease} - ${::architecture}",
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

  yumrepo { 'puppetlabs-products-source':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/products/SRPMS",
    descr    => "Puppet Labs Products ${::operatingsystem} ${::operatingsystemmajrelease} - Source",
    enabled  => bool2num($puppetlabs_yum::enable_source_repos),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

  yumrepo { 'puppetlabs-dependencies':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/dependencies/${::architecture}",
    descr    => "Puppet Labs Dependencies ${::operatingsystem} ${::operatingsystemmajrelease} - ${::architecture}",
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

  yumrepo { 'puppetlabs-dependencies-source':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/dependencies/SRPMS",
    descr    => "Puppet Labs Dependencies ${::operatingsystem} ${::operatingsystemmajrelease} - Source",
    enabled  => bool2num($puppetlabs_yum::enable_source_repos),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

  yumrepo { 'puppetlabs-devel':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/devel/${::architecture}",
    descr    => "Puppet Labs Devel ${::operatingsystem} ${::operatingsystemmajrelease} - ${::architecture}",
    enabled  => bool2num($puppetlabs_yum::enable_devel_repo),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

  yumrepo { 'puppetlabs-devel-source':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/devel/SRPMS",
    descr    => "Puppet Labs Devel ${::operatingsystem} ${::operatingsystemmajrelease} - Source",
    enabled  => bool2num($puppetlabs_yum::enable_source_repos and $puppetlabs_yum::enable_devel_repo),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

}

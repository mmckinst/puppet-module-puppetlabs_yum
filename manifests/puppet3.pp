class puppetlabs_yum::puppet3 inherits puppetlabs_yum {
  yumrepo { 'puppetlabs-products':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/products/${::architecture}",
    descr    => "Puppet Labs Products ${::operatingsystem} ${::operatingsystemmajrelease} - ${::architecture}",
    enabled  => bool2num($puppetlabs_yum::puppet3_products_enabled),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

  yumrepo { 'puppetlabs-products-source':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/products/SRPMS",
    descr    => "Puppet Labs Products ${::operatingsystem} ${::operatingsystemmajrelease} - Source",
    enabled  => bool2num($puppetlabs_yum::puppet3_products_source_enabled),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

  yumrepo { 'puppetlabs-dependencies':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/dependencies/${::architecture}",
    descr    => "Puppet Labs Dependencies ${::operatingsystem} ${::operatingsystemmajrelease} - ${::architecture}",
    enabled  => bool2num($puppetlabs_yum::puppet3_dependencies_enabled),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

  yumrepo { 'puppetlabs-dependencies-source':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/dependencies/SRPMS",
    descr    => "Puppet Labs Dependencies ${::operatingsystem} ${::operatingsystemmajrelease} - Source",
    enabled  => bool2num($puppetlabs_yum::puppet3_dependencies_source_enabled),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

  yumrepo { 'puppetlabs-devel':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/devel/${::architecture}",
    descr    => "Puppet Labs Devel ${::operatingsystem} ${::operatingsystemmajrelease} - ${::architecture}",
    enabled  => bool2num($puppetlabs_yum::puppet3_devel_enabled),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

  yumrepo { 'puppetlabs-devel-source':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/devel/SRPMS",
    descr    => "Puppet Labs Devel ${::operatingsystem} ${::operatingsystemmajrelease} - Source",
    enabled  => bool2num($puppetlabs_yum::puppet3_devel_source_enabled),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

}

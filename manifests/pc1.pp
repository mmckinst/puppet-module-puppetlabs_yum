class puppetlabs_yum::pc1 inherits puppetlabs_yum {
  yumrepo { 'puppetlabs-pc1':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/PC1/${::architecture}",
    descr    => "Puppet Labs PC1 Repository ${::operatingsystem} ${::operatingsystemmajrelease} - ${::architecture}",
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }

    yumrepo { 'puppetlabs-pc1-source':
    baseurl  => "${puppetlabs_yum::url_prefix}/${puppetlabs_yum::os_url}/PC1/SRPMS",
    descr    => "Puppet Labs PC1 Repository ${::operatingsystem} ${::operatingsystemmajrelease} - Source",
    enabled  => bool2num($puppetlabs_yum::enable_source_repos),
    gpgcheck => '1',
    gpgkey   => $puppetlabs_yum::puppetlabs_gpgkey,
  }
}

# Private class
class puppetlabs_yum::collection {

  if $puppetlabs_yum::enable_collection {
    $enabled = '1'
  } else {
    $enabled = '0'
  }

  yumrepo { 'puppetlabs-collection':
    baseurl  => $puppetlabs_yum::collection_baseurl,
    descr    => $puppetlabs_yum::collection_descr,
    enabled  => $enabled,
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }

  yumrepo { 'puppetlabs-collection-source':
    baseurl        => $puppetlabs_yum::collection_source_baseurl,
    descr          => $puppetlabs_yum::collection_source_descr,
    enabled        => '0',
    failovermethod => 'priority',
    gpgcheck       => '1',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }
}

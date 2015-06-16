shared_context :puppetlabs_yum_collection do
  it do
    should contain_yumrepo('puppetlabs-collection').with({
      :enabled   => '0',
      :gpgcheck  => '1',
      :gpgkey    => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-collection-source').with({
      :enabled    => '0',
      :gpgcheck   => '1',
      :gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    })
  end

  context 'when enable_collection => true' do
    let(:params) {{:enable_collection => true }}

    it { should contain_yumrepo('puppetlabs-collection').with_enabled('1')}
  end
end

shared_examples_for 'puppetlabs_yum::collection-el6' do
  include_context :puppetlabs_yum_collection

  it do
    should contain_yumrepo('puppetlabs-collection').with({
      :baseurl   => 'http://yum.puppetlabs.com/el/6/PC1/$basearch',
      :descr     => 'Puppet Labs Collection 1 EL 6 - $basearch',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-collection-source').with({
      :baseurl   => 'http://yum.puppetlabs.com/el/6/PC1/SRPMS',
      :descr     => 'Puppet Labs Collection 1 EL 6 - $basearch - Source',
    })
  end
end

shared_examples_for 'puppetlabs_yum::collection-f20' do
  include_context :puppetlabs_yum_collection

  it do
    should contain_yumrepo('puppetlabs-collection').with({
      :baseurl   => 'http://yum.puppetlabs.com/fedora/f20/PC1/$basearch',
      :descr     => 'Puppet Labs Collection 1 Fedora 20 - $basearch',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-collection-source').with({
      :baseurl   => 'http://yum.puppetlabs.com/fedora/f20/PC1/SRPMS',
      :descr     => 'Puppet Labs Collection 1 Fedora 20 - $basearch - Source',
    })
  end
end

require 'spec_helper'

describe 'puppetlabs_yum' do
  describe 'puppet3' do
    context 'supported operating systems' do
      on_supported_os.each do |os, facts|
        context "on #{os}" do
          let(:facts) do
            facts
          end
  
          if facts[:operatingsystem] == 'Fedora'
            os_url = "fedora/#{facts[:operatingsystemmajrelease]}"
          else
            os_url = "el/#{facts[:operatingsystemmajrelease]}"
          end
  
          context "with the repo installed and no custom parameters" do
            let(:params) {{
              :install_puppet3_repo => true,
            }}
            it { is_expected.to contain_class('puppetlabs_yum') }
            it { is_expected.to contain_yumrepo('puppetlabs-products').with(
              'baseurl'  => "https://yum.puppetlabs.com/#{os_url}/products/#{facts[:architecture]}",
              'descr'    => "Puppet Labs Products #{facts[:operatingsystem]} #{facts[:operatingsystemmajrelease]} - #{facts[:architecture]}",
              'enabled'  => '1',
              'gpgcheck' => '1',
              'gpgkey'   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-products-source').with(
              'baseurl'  => "https://yum.puppetlabs.com/#{os_url}/products/SRPMS",
              'descr'    => "Puppet Labs Products #{facts[:operatingsystem]} #{facts[:operatingsystemmajrelease]} - Source",
              'enabled'  => '0',
              'gpgcheck' => '1',
              'gpgkey'   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-dependencies').with(
              'baseurl'  => "https://yum.puppetlabs.com/#{os_url}/dependencies/#{facts[:architecture]}",
              'descr'    => "Puppet Labs Dependencies #{facts[:operatingsystem]} #{facts[:operatingsystemmajrelease]} - #{facts[:architecture]}",
              'enabled'  => '1',
              'gpgcheck' => '1',
              'gpgkey'   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-dependencies-source').with(
              'baseurl'  => "https://yum.puppetlabs.com/#{os_url}/dependencies/SRPMS",
              'descr'    => "Puppet Labs Dependencies #{facts[:operatingsystem]} #{facts[:operatingsystemmajrelease]} - Source",
              'enabled'  => '0',
              'gpgcheck' => '1',
              'gpgkey'   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-devel').with(
              'baseurl'  => "https://yum.puppetlabs.com/#{os_url}/devel/#{facts[:architecture]}",
              'descr'    => "Puppet Labs Devel #{facts[:operatingsystem]} #{facts[:operatingsystemmajrelease]} - #{facts[:architecture]}",
              'enabled'  => '0',
              'gpgcheck' => '1',
              'gpgkey'   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-devel-source').with(
              'baseurl'  => "https://yum.puppetlabs.com/#{os_url}/devel/SRPMS",
              'descr'    => "Puppet Labs Devel #{facts[:operatingsystem]} #{facts[:operatingsystemmajrelease]} - Source",
              'enabled'  => '0',
              'gpgcheck' => '1',
              'gpgkey'   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs')}
 	  end
          context "with the repo installed and custom parameters" do
            let(:params) {{
              :url_prefix           => 'https://mirror.example.com/puppetlabs/yum',
              :puppetlabs_gpgkey    => 'https://mirror.example.com/puppetlabs/yum/RPM-GPG-KEY-puppetlabs',
              :enable_source_repos  => true,
              :enable_devel_repo    => true,
              :install_puppet3_repo => true,
            }}
            it { is_expected.to contain_yumrepo('puppetlabs-products').with(
              'baseurl'  => "https://mirror.example.com/puppetlabs/yum/#{os_url}/products/#{facts[:architecture]}",
              'enabled'  => '1',
              'gpgkey'   => 'https://mirror.example.com/puppetlabs/yum/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-products-source').with(
              'baseurl'  => "https://mirror.example.com/puppetlabs/yum/#{os_url}/products/SRPMS",
              'enabled'  => '1',
              'gpgkey'   => 'https://mirror.example.com/puppetlabs/yum/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-dependencies').with(
              'baseurl'  => "https://mirror.example.com/puppetlabs/yum/#{os_url}/dependencies/#{facts[:architecture]}",
              'enabled'  => '1',
              'gpgkey'   => 'https://mirror.example.com/puppetlabs/yum/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-dependencies-source').with(
              'baseurl'  => "https://mirror.example.com/puppetlabs/yum/#{os_url}/dependencies/SRPMS",
              'enabled'  => '1',
              'gpgkey'   => 'https://mirror.example.com/puppetlabs/yum/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-devel').with(
              'baseurl'  => "https://mirror.example.com/puppetlabs/yum/#{os_url}/devel/#{facts[:architecture]}",
              'enabled'  => '1',
              'gpgkey'   => 'https://mirror.example.com/puppetlabs/yum/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-devel-source').with(
              'baseurl'  => "https://mirror.example.com/puppetlabs/yum/#{os_url}/devel/SRPMS",
              'enabled'  => '1',
              'gpgkey'   => 'https://mirror.example.com/puppetlabs/yum/RPM-GPG-KEY-puppetlabs')}
          end
        end
      end
    end
  end
end

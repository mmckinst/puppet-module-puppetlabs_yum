require 'spec_helper'

describe 'puppetlabs_yum' do
  describe 'pc1' do
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

          context "without any parameters" do
            it { is_expected.to contain_class('puppetlabs_yum') }
            it { is_expected.to contain_yumrepo('puppetlabs-pc1').with(
              'baseurl'  => "https://yum.puppetlabs.com/#{os_url}/PC1/#{facts[:architecture]}",
              'descr'    => "Puppet Labs PC1 Repository #{facts[:operatingsystem]} #{facts[:operatingsystemmajrelease]} - #{facts[:architecture]}",
              'enabled'  => '1',
              'gpgcheck' => '1',
              'gpgkey'   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-pc1-source').with(
              'baseurl'  => "https://yum.puppetlabs.com/#{os_url}/PC1/SRPMS",
              'descr'    => "Puppet Labs PC1 Repository #{facts[:operatingsystem]} #{facts[:operatingsystemmajrelease]} - Source",
              'enabled'  => '0',
              'gpgcheck' => '1',
              'gpgkey'   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs')}
	  end
          context "custom parameters" do
            let(:params) {{
              :url_prefix          => 'https://mirror.example.com/puppetlabs/yum',
              :puppetlabs_gpgkey   => 'https://mirror.example.com/puppetlabs/yum/RPM-GPG-KEY-puppetlabs',
              :enable_source_repos => true,
            }}

            it { is_expected.to contain_yumrepo('puppetlabs-pc1').with(
              'baseurl'  => "https://mirror.example.com/puppetlabs/yum/#{os_url}/PC1/#{facts[:architecture]}",
              'enabled'  => '1',
              'gpgkey'   => 'https://mirror.example.com/puppetlabs/yum/RPM-GPG-KEY-puppetlabs')}
            it { is_expected.to contain_yumrepo('puppetlabs-pc1-source').with(
              'baseurl'  => "https://mirror.example.com/puppetlabs/yum/#{os_url}/PC1/SRPMS",
              'enabled'  => '1',
              'gpgkey'   => 'https://mirror.example.com/puppetlabs/yum/RPM-GPG-KEY-puppetlabs')}
          end
        end
      end
    end
  end
end

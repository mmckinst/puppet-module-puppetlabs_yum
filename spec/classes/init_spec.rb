require 'spec_helper'

describe 'puppetlabs_yum' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "puppetlabs_yum class without any parameters" do
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('puppetlabs_yum::params') }
          it { is_expected.to contain_class('puppetlabs_yum::pc1') }
          it { is_expected.to_not contain_class('puppetlabs_yum::puppet3') }
	end
        context "puppetlabs_yum class with puppet3 enabled and pc1 disabled" do
          let(:params) {{
            :install_puppet3_repo   => true,
            :install_pc1_repo       => false,
          }}

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('puppetlabs_yum::params') }
          it { is_expected.to_not contain_class('puppetlabs_yum::pc1') }
          it { is_expected.to contain_class('puppetlabs_yum::puppet3') }
	end

      end
    end
  end
end

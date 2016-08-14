require 'spec_helper_acceptance'

describe 'puppetlabs_yum::puppet3 class' do
  it 'should run successfully' do
    pp = <<-EOS
         class { '::puppetlabs_yum': 
           puppet3_repo_install => true,
           pc1_repo_install     => false,
         }
         EOS
    # Apply twice to ensure no errors the second time.
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end

  describe yumrepo('puppetlabs-pc1') do
    it { should_not exist }
  end
  describe yumrepo('puppetlabs-pc1-source') do
    it { should_not exist }
  end

  describe yumrepo('puppetlabs-products') do
    it { should exist }
    it { should be_enabled }
  end
  describe yumrepo('puppetlabs-products-source') do
    it { should exist }
    it { should_not be_enabled }
  end

  describe yumrepo('puppetlabs-dependencies') do
    it { should exist }
    it { should be_enabled }
  end
  describe yumrepo('puppetlabs-dependencies-source') do
    it { should exist }
    it { should_not be_enabled }
  end

  describe yumrepo('puppetlabs-devel') do
    it { should exist }
    it { should_not be_enabled }
  end
  describe yumrepo('puppetlabs-devel-source') do
    it { should exist }
    it { should_not be_enabled }
  end
end


require 'spec_helper_acceptance'

describe 'yum' do
  let(:manifest) {
    <<-CLASSPARAMETER
class { 'yum':
  manage                   => true,
  tmpfs                    => true,
  auto_update              => true,
  yum_exclude              => 'kernel*',
  repo_custom              => true,
  repo_epel                => true,
  repo_foreman             => true,
  repo_icinga              => true,
  repo_ovirt               => true,
  repo_owncloud            => true,
  repo_passenger           => true,
  repo_puppetlabs          => true,
  repo_softwarecollections => true,
  repo_upgradetool         => true,
}
CLASSPARAMETER
  }

  it 'should apply without errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'should apply a second time without changes' do
    @result = apply_manifest(manifest)
    expect(@result.exit_code).to be_zero
  end

  describe file('/etc/yum.conf') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/sysconfig/yum-autoupdate') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/sysconfig/yum-cron') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/yum.repos.d/epel.repo') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/yum.repos.d/epel-testing.repo') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/yum.repos.d/foreman.repo') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/yum.repos.d/foreman-plugins.repo') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/yum.repos.d/ICINGA-release.repo') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/yum.repos.d/ovirt-3.6.repo') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/yum.repos.d/ovirt-3.6-dependencies.repo') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/yum.repos.d/owncloud.repo') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/yum.repos.d/puppetlabs-pc1.repo') do
    it { should be_file }
    it { should exist }
  end

  describe package('yum') do
    it { should be_installed }
  end

  describe package('deltarpm') do
    it { should be_installed }
  end

  describe package('yum-cron') do
    it { should be_installed }
  end
end

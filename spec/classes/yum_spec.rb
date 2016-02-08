require 'spec_helper'

describe 'yum', :type => :class do

  context 'with defaults for all parameters' do
    it { should contain_class('yum') }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let(:params) {
        {
          :manage => true,
          :tmpfs => true,
          :auto_update => true,
          :yum_exclude => 'kernel*',
          :yum_proxy => 'http://proxy.domain.local:3128',
          :yum_proxy_user => 'user1',
          :yum_proxy_password => 'Secret1',
          :repo_custom => true,
          :repo_epel => true,
          :repo_foreman => true,
          :repo_icinga => true,
          :repo_ovirt => true,
          :repo_owncloud => true,
          :repo_passenger => true,
          :repo_puppetlabs => true,
          :repo_softwarecollections => true,
          :repo_upgradetool => true,
          :el_custom => 'http://repository.domain.local/el/$releasever/$basearch/'
        }
      }

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('yum::package') }
      it { is_expected.to contain_class('yum::config') }
      it { is_expected.to contain_class('yum::service') }

      it { is_expected.to contain_package('yum').with_ensure('installed') }
      it { is_expected.to contain_package('deltarpm').with_ensure('installed') }
      it { is_expected.to contain_package('yum-cron').with_ensure('installed') }

      it { is_expected.to contain_file('/etc/yum.conf').with_ensure('file') }
      it { is_expected.to contain_file('/var/lib/yum/repos').with_ensure('link') }

      it 'should generate valid content for yum.conf - generic part' do
        content = catalogue.resource('file', '/etc/yum.conf').send(:parameters)[:content]
        expect(content).to match('exclude=kernel*')
        expect(content).to match('proxy=http://proxy.domain.local:3128')
        expect(content).to match('proxy_username=user1')
        expect(content).to match('proxy_password=Secret1')
      end

      case facts[:operatingsystem]
      when 'CentOS'
        it { is_expected.to contain_file('/etc/yum.repos.d/CentOS-Base.repo').with_ensure('file') }
      when 'OracleLinux'
        it { is_expected.to contain_file('/etc/yum.repos.d/public-yum-ol7.repo').with_ensure('file') }
      else
        it { is_expected.to contain_warning('The current operating system is not supported!') }
      end
    end
  end
end

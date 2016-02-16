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

      it { is_expected.to contain_class('yum::params') }
      it { is_expected.to contain_class('yum::package') }
      it { is_expected.to contain_class('yum::config') }
      it { is_expected.to contain_class('yum::config::custom') }
      it { is_expected.to contain_class('yum::config::epel') }
      it { is_expected.to contain_class('yum::config::foreman') }
      it { is_expected.to contain_class('yum::config::icinga') }
      it { is_expected.to contain_class('yum::config::ovirt') }
      it { is_expected.to contain_class('yum::config::owncloud') }
      it { is_expected.to contain_class('yum::config::puppetlabs') }
      it { is_expected.to contain_class('yum::config::tmpfs') }
      it { is_expected.to contain_class('yum::service') }

      it { is_expected.to contain_package('yum').with_ensure('installed') }
      it { is_expected.to contain_package('deltarpm').with_ensure('installed') }
      it { is_expected.to contain_package('yum-cron').with_ensure('installed') }

      it { is_expected.to contain_file('/etc/pki/rpm-gpg').with_ensure('directory') }
      it { is_expected.to contain_file('/etc/yum.conf.d').with_ensure('directory') }

      it { is_expected.to contain_file('/etc/yum.conf').with_ensure('file') }
      it { is_expected.to contain_file('/var/lib/yum/repos').with_ensure('link') }

      it { is_expected.to contain_file('/etc/yum.repos.d/custom.repo').with_ensure('file') }
      it { is_expected.to contain_file('/etc/yum.repos.d/epel.repo').with_ensure('file') }
      it { is_expected.to contain_file('/etc/yum.repos.d/epel-testing.repo').with_ensure('file') }
      it { is_expected.to contain_file('/etc/yum.repos.d/foreman.repo').with_ensure('file') }
      it { is_expected.to contain_file('/etc/yum.repos.d/foreman-plugins.repo').with_ensure('file') }
      it { is_expected.to contain_file('/etc/yum.repos.d/ICINGA-release.repo').with_ensure('file') }
      it { is_expected.to contain_file('/etc/yum.repos.d/ovirt-3.6.repo').with_ensure('file') }
      it { is_expected.to contain_file('/etc/yum.repos.d/ovirt-3.6-dependencies.repo').with_ensure('file') }
      it { is_expected.to contain_file('/etc/yum.repos.d/owncloud.repo').with_ensure('file') }
      it { is_expected.to contain_file('/etc/yum.repos.d/puppetlabs-pc1.repo').with_ensure('file') }

      it 'should generate valid content for yum.conf - generic part' do
        content = catalogue.resource('file', '/etc/yum.conf').send(:parameters)[:content]
        expect(content).to match('exclude=kernel*')
        expect(content).to match('proxy=http://proxy.domain.local:3128')
        expect(content).to match('proxy_username=user1')
        expect(content).to match('proxy_password=Secret1')
      end

      it { is_expected.to contain_exec('move_repo_directory').with(
        'path'    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
        'command' => "mv /var/lib/yum/repos /var/lib/yum/repos.orig",
        'onlyif'  => "test ! -L /var/lib/yum/repos"
        )
      }

      it { is_expected.to contain_exec('yum-cache').with(
        'command'     => 'yum clean all && yum makecache',
        'path'        => '/bin:/sbin:/usr/bin:/usr/sbin',
        'refreshonly' => 'true'
        )
      }

      it { is_expected.to contain_exec('yum-rpm-key-import').with(
        'command'     => 'rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-*',
        'path'        => '/bin:/sbin:/usr/bin:/usr/sbin',
        'refreshonly' => 'true'
        )
      }

      case facts[:operatingsystem]
      when 'CentOS'
        it { is_expected.to contain_class('yum::config::centos') }
        it { is_expected.to contain_file('/etc/yum.repos.d/CentOS-Base.repo').with_ensure('file') }
      when 'OracleLinux'
        it { is_expected.to contain_class('yum::config::oel') }
        it { is_expected.to contain_file('/etc/yum.repos.d/public-yum-ol7.repo').with_ensure('file') }
      when 'Scientific'
        it { is_expected.to contain_class('yum::config::sl') }
        it { is_expected.to contain_file('/etc/yum.repos.d/sl6x.repo').with_ensure('file') }
      else
        it { is_expected.to contain_warning('The current operating system is not supported!') }
      end
    end
  end
end

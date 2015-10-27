require 'spec_helper'

describe "yum" do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('yum::package') }
      it { is_expected.to contain_class('yum::config') }
      it { is_expected.to contain_class('yum::service') }

      case facts[:osfamily]
      when 'Debian'
      when 'RedHat'
        if facts[:lsbmajdistrelease] = '5'
        else
        end
      else
        it { is_expected.to contain_warning('The current operating system is not supported!') }
      end
    end
  end
end

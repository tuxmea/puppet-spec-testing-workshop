require 'spec_helper'

describe 'testing_workshop', :type => :class do
    context "it should compile on os family Debian with default parameters" do
      let(:facts) do
        {
                :os => {
                        :family => 'Debian',
                }
        }
      end

      it { should compile.with_all_deps }
      it { should contain_package('less') }
      it { should contain_file('/etc/lessrc') }
      it { should contain_notify('OS family: Debian') }

    end
    context "it should compile on family Debian with validate set to true" do
      let(:node) { 'testapp.domain.com' }
      let(:hiera_config) { 'spec/hiera/hiera.yaml' }

      let(:facts) do
        {
                :os => {
                        :family => 'Debian',
                }
        }
      end

      it { should compile.with_all_deps }
      it { should contain_file('/tmp/validation') }
    end
    context "it should compile on Debian with validate set false parameter" do
      let(:facts) do
        {
                :os => {
                        :family => 'Debian',
                }
        }
      end
      let (:params) do
        { :validate => 'foo' }
      end

      it { is_expected.to compile.and_raise_error(/expects a Boolean value/) }
    end
end

require 'spec_helper'

describe 'testing_workshop', :type => :class do
  on_supported_os.each do |os, facts|
    context "it should compile on #{os} with default parameters" do
      let(:facts) do
        facts
      end

      it { should compile.with_all_deps }
      it { should contain_package('less') }
      it { should contain_file('/etc/lessrc') }
    end
    context "it should compile on #{os} with validate set to true" do
      let(:facts) do
        facts
      end
      let (:params) do
        { :validate => true }
      end

      it { should compile.with_all_deps }
      it { should contain_notify('validation enabled') }
    end
    context "it should compile on #{os} with validate set false parameter" do
      let(:facts) do
        facts
      end
      let (:params) do
        { :validate => 'foo' }
      end

      it { is_expected.to compile.and_raise_error(/expects a Boolean value/) }
    end
  end
end

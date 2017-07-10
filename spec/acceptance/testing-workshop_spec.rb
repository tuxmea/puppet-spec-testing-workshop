require 'spec_helper_acceptance'

describe 'testing-workshop' do
  describe 'without parameters' do
    it 'should idempotently run' do
      pp = <<-EOS
        include testing_workshop
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
    describe package('less') do
      it { should be_installed }
    end
    describe file('/etc/lessrc') do
      it { should exist }
    end
  end
end

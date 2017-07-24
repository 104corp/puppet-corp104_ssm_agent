require 'spec_helper'

describe 'corp104_ssm_agent', :type => 'class' do
  context 'with defaults for all parameters' do
    let(:facts) do { 
      :osfamily => 'Debian',
    }
    end
    it do
      should contain_class('corp104_ssm_agent')
      should contain_class('corp104_ssm_agent::install')
      should contain_class('corp104_ssm_agent::config')
      should contain_class('corp104_ssm_agent::service')
    end

    it do
      should compile.with_all_deps
    end
  end
  
end
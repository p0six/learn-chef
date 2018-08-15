#
# Cookbook:: webserver_test
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

shared_examples 'what we do' do |os, version, package, service|
  context "When all attributes are default, on #{os} #{version}" do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: os, version: version)
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it "installs #{package}" do
      expect(chef_run).to install_package package
    end

    it "enables the #{service} service" do
      expect(chef_run).to enable_service service
    end

    it "starts the #{service} service" do
      expect(chef_run).to start_service service
    end
  end
end

describe 'webserver_test::default' do
  runners = {
    'centos' => ['7.4.1708', 'httpd', 'httpd'],
    'ubuntu' => ['16.04', 'apache2', 'apache2'],
  }

  runners.each do |os, os_data|
    # include_examples 'what we do', os, *os_data # *os_data is called a "splat". shorthand for below
    include_examples 'what we do', os, os_data[0], os_data[1], os_data[2] # this also works.
  end
end

# # encoding: utf-8

# Inspec test for recipe meteor-app::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe port(3000) do
  it { should be_listening }
end

describe file('/usr/local/bin/meteor') do
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

describe directory('/home/vagrant/dev') do
  it { should exist }
  its('owner') { should eq 'vagrant' }
  its('group') { should eq 'vagrant' }
end

describe directory('/home/vagrant/dev/my_first_app') do
  it { should exist }
end

describe processes('node') do
  it { should exist }
  its('list.length') { should eq 2 }
  its('users') { should eq ['vagrant', 'vagrant'] }
end

describe processes('mongod') do
  it { should exist }
  its('list.length') { should eq 1 }
  its('users') { should eq ['vagrant'] }
end

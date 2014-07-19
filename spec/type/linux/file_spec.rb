require 'spec_helper'

set :os, {:family => 'linux'}

property[:os_by_host] = nil

describe commands.command_class('file') do
  it { should be_an_instance_of(Specinfra::Command::Linux::Base::File) }
end

describe file('/tmp') do
  it { should be_readable.by_user('mail') }
end

describe file('/tmp') do
  it { should_not be_readable.by_user('invalid-user') }
end

describe file('/tmp') do
  it { should be_writable.by_user('mail') }
end

describe file('/tmp') do
  it { should_not be_writable.by_user('invalid-user') }
end


describe file('/tmp') do
  it { should be_executable.by_user('mail') }
end

describe file('/tmp') do
  it { should_not be_executable.by_user('invalid-user') }
end

describe file('/tmp') do
  it { should be_immutable }
end

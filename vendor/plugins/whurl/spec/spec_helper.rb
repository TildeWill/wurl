# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require "rubygems"
require 'spec'

dir = File.dirname(__FILE__)
lib_path = File.expand_path(File.join(dir,'..','lib'))
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}
Dir[File.expand_path(File.join(File.dirname(__FILE__),'shared','**','*.rb'))].each {|f| require f}

Spec::Runner.configure do |config|
end
require 'whurl'
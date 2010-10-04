require 'spec_helper'

describe Whurl::Command do
  describe "#url" do
    it "should collapse parameters specified after a '?' and as data" do
      url = "http://www.example.com?foo=bar"
      command = Whurl::Command.new(url, "GET", :param_keys => ['baz'], :param_values => ['fooz'])
      command.url.should == "http://www.example.com?foo=bar&baz=fooz"
    end
  end
end
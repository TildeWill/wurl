require 'spec_helper'

describe Command do

  describe "new" do
    it "makes a command" do
      command = Command.new(:url => "http://foo.com",
                            :method => "POST",
                            :param_keys => %w(car font_door),
                            :param_values => %w(1 2),
                            :header_keys => %w(soccer document),
                            :header_values => %w(3 4)
      )
      command.save!
      command.param_values.should == ['1', '2']
    end
  end

  describe "#url" do
    xit "should collapse parameters specified after a '?' and as data" do
      url = "http://www.example.com?foo=bar"
      command = Whurl::Command.new(url, "GET", :param_keys => ['baz'], :param_values => ['fooz'])
      command.url.should == "http://www.example.com?foo=bar&baz=fooz"
    end
  end
end
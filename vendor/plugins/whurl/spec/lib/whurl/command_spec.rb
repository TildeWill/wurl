require File.expand_path(File.join(File.dirname(__FILE__),'..', '..', 'spec_helper'))

describe Whurl::Command do

  describe "new" do
    it "makes a command" do
      command = Command.new(:url => "http://foo.com",
                            :http_method => "POST",
                            :param_keys => %w(car font_door),
                            :param_values => %w(1 2),
                            :header_keys => %w(soccer document),
                            :header_values => %w(3 4)
      )
      command.save!
      command.param_values.should == ['1', '2']
    end
  end
end
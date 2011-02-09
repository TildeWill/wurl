require 'spec_helper'

describe Whurl do
  it "has a unique hash value after initialization" do
    whurl = Whurl.create
#    whurl.hash_key.length.should == 6
    whurl2 = Whurl.create
    whurl2.hash_key.should_not == whurl.hash_key
  end
end

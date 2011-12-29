require 'spec_helper'

describe WhurlEngine::Request do
  describe "a new request" do
    it "has an empty hash for the headers" do
      request = WhurlEngine::Request.new
      request.headers == {}
    end

    it "has an empty hash for the query params" do
      request = WhurlEngine::Request.new
      request.query.should == {}
    end

    it "has a hash key for uniquely identifying it" do
      request = WhurlEngine::Request.new
      request.hash_key.should be_present
    end
  end
end
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

  describe "to_s" do
    it "returns the method and url and http protocol used" do
      stub_request(:get, "https://www.google.com/")
      request = WhurlEngine::Request.new(:http_method => 'get', :url => 'https://www.google.com/')
      request.to_s.should =~ /^GET \/ HTTP\/1\.1/
    end
  end

  describe "response" do
    it "formats the GET request correctly" do
      stub_request(:any, "https://example.com/some_endpoint?client_id=abc123")

      request = WhurlEngine::Request.new(:http_method => 'get', :url => "https://example.com/some_endpoint", :query => {
          :client_id => "abc123"
      })

      request.response
      WebMock.should have_requested(:get, "https://example.com/some_endpoint?client_id=abc123").once
    end

    it "formats the POST request correctly" do
      stub_request(:post, "https://example.com/some_endpoint").
        with(:body => "client_id=abc123")

      request = WhurlEngine::Request.new(:http_method => 'post', :url => "https://example.com/some_endpoint", :query => {
              :client_id => "abc123"
      })
      request.response
      WebMock.should have_requested(:post, "https://example.com/some_endpoint").with(:body => 'client_id=abc123').once
    end

    it "formats the PUT request correctly" do
      stub_request(:put, "https://example.com/some_endpoint").
        with(:body => "client_id=abc123")
      request = WhurlEngine::Request.new(:http_method => 'put', :url => "https://example.com/some_endpoint", :query => {
          :client_id => "abc123"})
      request.response
      WebMock.should have_requested(:put, "https://example.com/some_endpoint").with(:body => 'client_id=abc123').once
    end

    it "formats the DELETE request correctly" do
      stub_request(:delete, "https://example.com/some_endpoint?client_id=abc123")
      request = WhurlEngine::Request.new(:http_method => 'delete', :url => "https://example.com/some_endpoint", :query => {
          :client_id => "abc123"
      })
      request.response
      WebMock.should have_requested(:delete, "https://example.com/some_endpoint?client_id=abc123").once
    end
  end
end
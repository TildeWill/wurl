require 'spec_helper'

describe WhurlEngine::Whurl do
  describe "a new request" do
    it "has an empty hash for the headers" do
      request = WhurlEngine::Whurl.new
      request.headers == {}
    end

    it "has an empty hash for the query params" do
      request = WhurlEngine::Whurl.new
      request.query.should == {}
    end

    it "has a hash key for uniquely identifying it" do
      request = WhurlEngine::Whurl.new
      request.hash_key.should be_present
    end
  end

  describe "to_s" do
    it "returns the method and url and http protocol used" do
      stub_request(:get, "https://www.google.com/")
      request = WhurlEngine::Whurl.new(:http_method => 'get', :url => 'https://www.google.com/')
      request.to_s.should =~ /^GET \/ HTTP\/1\.1/
    end
  end

  describe "to_curl" do
    describe "GET" do
      it "returns a properly formatted curl command" do
        request = WhurlEngine::Whurl.new(:http_method => 'get', :url => 'https://www.google.com/', :headers => {'X-Foo' => "foo"})
        request.to_curl.should == "curl \"https://www.google.com/\" --include --request GET -H X-Foo:foo"
      end
    end

    describe "POST" do
      it "returns a properly formatted curl command" do
        request = WhurlEngine::Request.new(:http_method => 'post', :url => 'https://www.google.com/', :headers => {'X-Foo' => "foo"}, :body => 'somebody')
        request.to_curl.should == "curl \"https://www.google.com/\" --include --request POST -H X-Foo:foo --data \"somebody\""
      end
    end
    describe "HEAD" do
      it "returns a properly formatted curl command" do
        request = WhurlEngine::Whurl.new(:http_method => 'head', :url => 'https://www.google.com/')
        request.to_curl.should == "curl \"https://www.google.com/\" --include --request HEAD --head"
      end
    end
  end

  describe "response" do
    it "formats the GET request correctly" do
      stub_request(:any, "https://example.com/some_endpoint?client_id=abc123")

      request = WhurlEngine::Whurl.new(:http_method => 'get', :url => "https://example.com/some_endpoint", :query => {
          :client_id => "abc123"
      })

      request.response
      WebMock.should have_requested(:get, "https://example.com/some_endpoint?client_id=abc123").once
    end

    it "formats the POST request correctly" do
      stub_request(:post, "https://example.com/some_endpoint").
        with(:body => "client_id=abc123")

      request = WhurlEngine::Whurl.new(:http_method => 'post', :url => "https://example.com/some_endpoint", :query => {
              :client_id => "abc123"
      })
      request.response
      WebMock.should have_requested(:post, "https://example.com/some_endpoint").with(:body => 'client_id=abc123').once
    end

    it "formats the PUT request correctly" do
      stub_request(:put, "https://example.com/some_endpoint").
        with(:body => "client_id=abc123")
      request = WhurlEngine::Whurl.new(:http_method => 'put', :url => "https://example.com/some_endpoint", :query => {
          :client_id => "abc123"})
      request.response
      WebMock.should have_requested(:put, "https://example.com/some_endpoint").with(:body => 'client_id=abc123').once
    end

    it "formats the DELETE request correctly" do
      stub_request(:delete, "https://example.com/some_endpoint?client_id=abc123")
      request = WhurlEngine::Whurl.new(:http_method => 'delete', :url => "https://example.com/some_endpoint", :query => {
          :client_id => "abc123"
      })
      request.response
      WebMock.should have_requested(:delete, "https://example.com/some_endpoint?client_id=abc123").once
    end
  end
end
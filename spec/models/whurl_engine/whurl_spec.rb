require 'spec_helper'

describe WhurlEngine::Whurl do
  describe "a new request" do
    it "has a hash key for uniquely identifying it" do
      request = WhurlEngine::Whurl.new
      request.hash_key.should be_present
    end
  end

  describe "response" do
    it "formats the GET request correctly" do
      stub_request(:any, "https://example.com/some_endpoint?client_id=abc123")

      request = WhurlEngine::Whurl.new(:request_method => 'get', :request_url => "https://example.com/some_endpoint", :request_parameters => {
        :client_id => "abc123"
      })

      request.save

      WebMock.should have_requested(:get, "https://example.com/some_endpoint?client_id=abc123").once
    end

    it 'handles basic auth credentials' do
      stub_request(:any, 'https://foo:bar@example.com/some_endpoint?client_id=abc123')

      request = WhurlEngine::Whurl.new(:request_method => 'get', :request_url => 'https://example.com/some_endpoint',
                                       :basic_auth_user => 'foo', :basic_auth_password => 'bar',
                                       :request_parameters => {:client_id => 'abc123'}
      )

      request.save

      WebMock.should have_requested(:get, 'https://foo:bar@example.com/some_endpoint?client_id=abc123').once
    end

    it "formats the POST request correctly" do
      stub_request(:post, "https://example.com/some_endpoint").
        with(:body => "client_id=abc123")

      request = WhurlEngine::Whurl.new(:request_method => 'post', :request_url => "https://example.com/some_endpoint", :request_parameters => {
        :client_id => "abc123"
      })
      request.save
      WebMock.should have_requested(:post, "https://example.com/some_endpoint").with(:body => 'client_id=abc123').once
    end

    it "formats the PUT request correctly" do
      stub_request(:put, "https://example.com/some_endpoint").
        with(:body => "client_id=abc123")
      request = WhurlEngine::Whurl.new(:request_method => 'put', :request_url => "https://example.com/some_endpoint", :request_parameters => {
        :client_id => "abc123"})
      request.save
      WebMock.should have_requested(:put, "https://example.com/some_endpoint").with(:body => 'client_id=abc123').once
    end

    it "formats the DELETE request correctly" do
      stub_request(:delete, "https://example.com/some_endpoint?client_id=abc123")
      request = WhurlEngine::Whurl.new(:request_method => 'delete', :request_url => "https://example.com/some_endpoint", :request_parameters => {
        :client_id => "abc123"
      })
      request.save
      WebMock.should have_requested(:delete, "https://example.com/some_endpoint?client_id=abc123").once
    end
  end
end
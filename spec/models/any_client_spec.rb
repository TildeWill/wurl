require 'spec_helper'

describe AnyClient do
  describe "request with headers and parameters" do
    before do
      stub_request(:any, "https://example.com/some_endpoint?client_id=abc123").
              with(:headers => {'User-Agent' => 'Whurl/1.1 (https://whurl.heroku.com)'})
    end

    it "formats the request correctly" do
      #get
      AnyClient.get("https://example.com/some_endpoint", :query => {
          :client_id => "abc123"
      }, :headers => {"User-Agent" => 'Whurl/1.1 (https://whurl.heroku.com)'})

      WebMock.should have_requested(:get, "https://example.com/some_endpoint?client_id=abc123").once

      #post
      AnyClient.post("https://example.com/some_endpoint", :query => {
          :client_id => "abc123"
      }, :headers => {"User-Agent" => 'Whurl/1.1 (https://whurl.heroku.com)'})

      WebMock.should have_requested(:post, "https://example.com/some_endpoint?client_id=abc123").once

      #put
      AnyClient.put("https://example.com/some_endpoint", :query => {
          :client_id => "abc123"
      }, :headers => {"User-Agent" => 'Whurl/1.1 (https://whurl.heroku.com)'})

      WebMock.should have_requested(:put, "https://example.com/some_endpoint?client_id=abc123").once

      #delete
      AnyClient.delete("https://example.com/some_endpoint", :query => {
          :client_id => "abc123"
      }, :headers => {"User-Agent" => 'Whurl/1.1 (https://whurl.heroku.com)'})

      WebMock.should have_requested(:delete, "https://example.com/some_endpoint?client_id=abc123").once
    end
  end

  describe "Multipart POST request with params" do
    before do
      stub_request(:post, "http://example.com/upload_file?client_id=abc123").
        with(:headers => {'Accept'=>'*/*', 'Content-Length'=>'332', 'Content-Type'=>'multipart/form-data; boundary=-----------RubyMultipartPost'})
    end
    it "formats the request correctly" do
      AnyClient.post("http://example.com/upload_file?client_id=abc123",
                     :query => { :client_id => "abc123", :media => File.new(File.dirname(__FILE__) + '/../fixtures/test_upload.txt')}
      )

      WebMock.should have_requested(:post, "http://example.com/upload_file?client_id=abc123")
    end
  end

  describe "POST request with params and a body" do
    before do
      stub_request(:post, "http://example.com/upload_file?client_id=abc123").
        with(:body => "some_json=%7B'foo'%3A'bar'%7D")
    end
    it "formats the request correctly" do
      AnyClient.post("http://example.com/upload_file?client_id=abc123",
                     :query => { :client_id => "abc123"},
                     :body => { :some_json => "{'foo':'bar'}" }
      )

      WebMock.should have_requested(:post, "http://example.com/upload_file?client_id=abc123").
                         with(:body => "some_json=%7B'foo'%3A'bar'%7D")
    end
  end

end

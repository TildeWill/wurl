require 'spec_helper'

describe WhurlsController do
  integrate_views

  before do
    request.env['HTTPS'] = 'on'
  end

  describe "#edit" do
    before do
      @whurl = whurls(:get_with_body_headers_and_query)
      stub_request(:get, "http://example.com/?param_foo=param_bar").
          with(:headers => {'Header-Foo'=>'header_bar', 'User-Agent'=>'Whurl/1.1 (https://whurl.heroku.com)'}).
          to_return(:headers => {"Location" => "http://www.google.com/", "X-XSS-Protection" => "1"})

    end

    def perform_request
      get :edit, :id => @whurl.hash_key
    end

    it_should_behave_like "requires ssl"

    it "assigns the headers in colon-separated capitalized format" do
      perform_request

      assigns[:response_headers].should match "<pre>Location: http://www.google.com/\nX-Xss-Protection: 1</pre>"
    end
  end

  describe "#create" do
    before do
      post :create, {"url" => "http://example.com",
                     "http_method" => "GET",
                     "header_keys" => ["header_foo"],
                     "header_values" => ["header_bar"],
                     "param_keys" => ["param_foo"],
                     "param_values" => ["param_bar"],
                     "body" => "zoo"
      }
    end
    it "makes a new Whurl" do
      whurl = Whurl.last
      whurl.data[:url].should == "http://example.com"
      whurl.data[:http_method].should == "GET"
      whurl.data[:headers].should == {'header_foo' => "header_bar"}
      whurl.data[:query].should == {'param_foo' => "param_bar"}
      whurl.data[:body].should == "zoo"
    end

    it "redirects to the edit page" do
      whurl = Whurl.last
      response.should redirect_to(short_url(whurl.hash_key))
    end
  end
end
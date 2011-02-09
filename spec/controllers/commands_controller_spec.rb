require 'spec_helper'

describe CommandsController do
  integrate_views

  before do
    request.env['HTTPS'] = 'on'
    stub_request(:any, "http://example.com?foo=bar").
        to_return(:headers => {"Location" => "http://www.google.com/", "X-XSS-Protection" => "1"})

  end

  describe "#edit" do
    def perform_request
      get :edit, {"url" => "http://example.com",
                  "http_method" => "GET",
                  "header_keys" => [""],
                  "header_values" => [""],
                  "param_keys" => ["foo"],
                  "param_values" => ["bar"]
      }
    end
    it_should_behave_like "requires ssl"

    it "assigns the headers in colon separate capitalized format" do
      perform_request

      assigns[:response_headers].should match "<pre>Location: http://www.google.com/\nX-Xss-Protection: 1</pre>"
    end
  end
end
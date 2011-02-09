require 'spec_helper'

describe CommandsController do
  integrate_views

  before do
    request.env['HTTPS'] = 'on'
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
  end
end
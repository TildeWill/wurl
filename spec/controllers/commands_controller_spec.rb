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

    it "assigns a command" do
      perform_request
      assigns[:command].should be_present
    end

    it "assigns a command even with extra junk in the params" do
      get :edit, {"url" => "http://example.com",
                  "http_method" => "GET",
                  "header_keys" => [""],
                  "header_values" => [""],
                  "param_keys" => ["foo"],
                  "param_values" => ["bar"],
                  "junk" => "some_other_junk"
      }
      assigns[:command].should be_present
    end
  end
end
require 'spec_helper'

describe String do
  describe "#to_html" do
    it "doesn't blow up when there is no JSON body" do
      expect { "".to_html("application/json") }.to_not raise_error
    end
  end
end
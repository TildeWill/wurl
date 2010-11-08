shared_examples_for "requires ssl" do
  describe "requires ssl" do
    before do
      request.env['HTTPS'] = 'off'
    end
    after do
      request.env['HTTPS'] = 'on'
    end
    it "require ssl" do
      perform_request
      response.should be_redirect
    end
  end

end
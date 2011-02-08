require 'spec_helper'

describe Command do
  describe "POST data" do
    it "formats POST data correctly" do
      stub_request(:post, "https://example.com/upload_image")
      command = Command.new(
          :url => "https://example.com/upload_image",
          :http_method => "POST",
          :param_keys => [],
          :param_values => [],
          :header_keys => [],
          :header_values => [])
      command.send_request
      WebMock.should have_requested(:post, "https://example.com/upload_image").once

#    with(:body => {:data => {:a => '1', :b => 'five'}})
# `curl -F media=@#{photo.path} -F username=#{@username} -F password=#{@password} -F message='#{photo.title}' http://twitpic.com/api/upload`
#  curl -F media=@public/images/delete.png -F username=ill -F password=s1nclair -F message='Delete button' http://twitpic.com/api/upload
#      <?xml version="1.0" encoding="UTF-8"?>
      #<rsp status="ok">
      # <statusid></statusid>
      # <userid>15856400</userid>
      # <mediaid>3xlsrt</mediaid>
      # <mediaurl>http://twitpic.com/3xlsrt</mediaurl>
      #</rsp>
    end
  end
end

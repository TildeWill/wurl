WhurlEngine::Whurl.all.each do |whurl|
  return if whurl.data.nil?
  whurl.request_method = whurl.data[:http_method]
  whurl.request_parameters = whurl.data[:query]
  whurl.request_url = whurl.data[:url]
  whurl.request_body = whurl.data[:body]
  whurl.request_headers = HTTParty::Response::Headers.new(whurl.data[:headers])
  unless whurl.save
    puts "-" * 100
    p whurl.id
    pp whurl.errors
    puts "-" * 100
  else
    p "Updated #{whurl.id}"
  end
end
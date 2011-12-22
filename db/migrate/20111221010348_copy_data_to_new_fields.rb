class CopyDataToNewFields < ActiveRecord::Migration
  def self.up
    WhurlEngine::WhurlRequest.all.each do |whurl|
      return if whurl.data.nil?
      whurl.http_method = whurl.data[:http_method]
      whurl.query = whurl.data[:query]
      whurl.url = whurl.data[:url]
      whurl.body = whurl.data[:body]
      whurl.headers = whurl.data[:headers]
      unless whurl.save
        puts "-" * 100
        p whurl.id
        pp whurl.errors
        puts "-" * 100
      else
        p "Updated #{whurl.id}"
      end
    end
  end

  def self.down
    WhurlEngine::WhurlRequest.all.each do |whurl|
      whurl.data ||= {}
      whurl.data[:http_method] = whurl.http_method
      whurl.data[:query] = whurl.query
      whurl.data[:url] = whurl.url
      whurl.data[:body] = whurl.body
      whurl.data[:headers] = whurl.headers
      unless whurl.save
        puts "-" * 100
        p whurl.id
        pp whurl.errors
        puts "-" * 100
      else
        p "Updated #{whurl.id}"
      end
    end
  end
end

uris = Whurl.all;nil
uri_groups = uris.group_by {|whurl| begin; URI.parse(whurl.data[:url]).host; rescue URI::InvalidURIError; p "oops";end;};nil
uri_groups.each{|g, e|  puts "#{e.count}\t#{g}"}

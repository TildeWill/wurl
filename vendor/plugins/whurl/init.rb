target = File.join(Rails.root, 'public', 'javascripts', 'whurl')
javascripts = Pathname.new(File.dirname(__FILE__)) + 'public/javascripts'
FileUtils.mkdir_p(target)

javascripts.children.each do |file|
  FileUtils.cp_r(file, File.join(target, file.basename))
end
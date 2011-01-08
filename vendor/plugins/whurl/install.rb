begin #javascripts
  target = File.join(Rails.root, 'public', 'javascripts', 'whurl')
  files = Pathname.new(File.dirname(__FILE__)) + 'public/javascripts'
  FileUtils.mkdir_p(target)

  files.children.each do |file|
    FileUtils.cp_r(file, File.join(target, file.basename))
  end
end
begin #images
  target = File.join(Rails.root, 'public', 'images', 'whurl')
  files = Pathname.new(File.dirname(__FILE__)) + 'public/images'
  FileUtils.mkdir_p(target)

  files.children.each do |file|
    FileUtils.cp_r(file, File.join(target, file.basename))
  end
end
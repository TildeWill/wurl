begin #javascripts
  target = File.join(Rails.root, 'public', 'javascripts', 'whurl')
  javascripts = Pathname.new(File.dirname(__FILE__)) + 'public/javascripts'
  FileUtils.mkdir_p(target)

  javascripts.children.each do |file|
    FileUtils.cp_r(file, File.join(target, file.basename))
  end
end
begin #images
  target = File.join(Rails.root, 'public', 'images', 'whurl')
  javascripts = Pathname.new(File.dirname(__FILE__)) + 'public/images'
  FileUtils.mkdir_p(target)

  javascripts.children.each do |file|
    FileUtils.cp_r(file, File.join(target, file.basename))
  end
end

begin #migrations
  target = File.join(Rails.root, 'db', 'migrations')
  javascripts = Pathname.new(File.dirname(__FILE__)) + 'db/migrations'
  FileUtils.mkdir_p(target)

  javascripts.children.each do |file|
    puts file.basename.to_s
    migration_file_parts = file.basename.to_s.split(/\./)
    migration_file_parts[0] += "_whurl"

    FileUtils.cp_r(file, File.join(target, migration_file_parts.join('.')))
  end
end
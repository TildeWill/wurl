$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "whurl_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "whurl_engine"
  s.version     = WhurlEngine::VERSION
  s.authors     = ["Will Read"]
  s.email       = ["will.read@gmail.com"]
  s.homepage    = ""
  s.summary     = "A web interface to curl for demonstrating APIs to muggles"
  s.description = "Whurl is a mountable engine for Rails 3.1+ apps allowing
                  you to show the functionality of your API. You can save API calls and share them with your team or the public."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "mysql", "~> 2.8.1"
end

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wurl_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wurl_engine"
  s.version     = WurlEngine::VERSION
  s.authors     = ["Will Read"]
  s.email       = ["will.read@gmail.com"]
  s.homepage    = "https://github.com/TildeWill/wurl_engine"
  s.summary     = "A web interface to curl for demonstrating APIs to muggles"
  s.description = "Wurl is a mountable engine for Rails 3.1+ apps allowing
                  you to show the functionality of your API. You can save API calls and share them with your team or the public."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'coderay', '~> 0.9'
  s.add_dependency 'coffee-script'
  s.add_dependency 'httmultiparty', '~> 0.2'
  s.add_dependency 'haml', '~> 3.1'
  s.add_dependency 'json', '>= 1.5'
  s.add_dependency 'rails', '~> 3.1'
  s.add_dependency "rinku", "~> 1.5"
  s.add_dependency 'sass', '~> 3.1'
  s.add_dependency 'uglifier'

  s.add_development_dependency 'heroku'
  s.add_development_dependency 'mysql', '~> 2.8.1'
  s.add_development_dependency 'jasmine', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 2.7.0'
  s.add_development_dependency 'rspec-rails', '~> 2.7.0'
  s.add_development_dependency 'webmock', '~> 1.7.10'
end

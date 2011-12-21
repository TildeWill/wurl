# Whurl

An API Playground. This code is deployed and available for public use.
* Great for evaluating an API
* Useful for doing story acceptance when developing an API
* Gives pretty-printed output and the browser saves your input making it easy to reuse

## Installation
    gem install whurl_engine
    rake whurl_engine:install:migrations
    rake db:migrate

Then in your main app's routes.rb file, add this:

    mount WhurlEngine::Engine => "/whurl", :as => "whurl_engine"
## Goals

* Use HTTPS for all requests, assume all users are passing sensitive data
* Store as little as possible, assume all users want privacy
* Provide a usable tool for working with APIs
* Further the use of Whurl through viral "whurls" - the urls that represent an API request
* Prevent abuse - users should not be able to use Whurl as a proxy for a DoS attack or similar

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

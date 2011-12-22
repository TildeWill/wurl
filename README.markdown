# Whurl

An API Playground.

* Great for demonstrating an API's functionality
* Useful for doing story acceptance when developing an API
* Gives pretty-printed output and the browser saves your input making it easy to reuse

## Installation
    gem install whurl_engine
    rake whurl_engine:install:migrations
    rake db:migrate

Then in your main app's routes.rb file, add this:

    mount WhurlEngine::Engine => "/whurl", :as => "whurl_engine"

Finally, look at your new API playground by starting your rails server and hitting up the right URL:

    http://localhost:3000/whurl

Or, to provide a clearer picture for your developer community, you may want to do this:

    mount WhurlEngine::Engine => "/api", :as => "api"

## Customize Whurl to Match Your Application

Rails 3.1 Mountable Engines make it easy to override or extend many parts of Whurl.
If you need to override a method, view or partial, create the corresponding file in your
main app directory and it will be used instead.

* Controllers & Helpers: See Engines::RailsExtensions::Dependencies for more information.
* Views: now handled almost entirely by ActionView itself (see Engines::Plugin#add_plugin_view_paths for more information)

For instance, you may want to change the overall presentation layout of Whurl to match your app.
To do so, simply create a new application.html.haml in the corresponding directory your main app:

    _ my-app
    \_ app
      \_ views
        \_layouts
          \_ whurl_engine
            \_ application.html.haml

## Goals for this project

* Use HTTPS for all requests, assume all users are passing sensitive data
* Provide a usable tool for working with APIs
* Further the use of Whurl through viral "whurls" - the urls that represent an API request
* Prevent abuse - users should not be able to use Whurl as a proxy for a DoS attack or similar

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally (actually, this should come before adding code, TDD!).
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request.

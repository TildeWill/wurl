# Wurl

An API Playground.

* Great for demonstrating an API's functionality
* Useful for doing story acceptance when developing an API
* Gives pretty-printed output and the browser saves your input making it easy to reuse

## Installation

Add the wurl_engine gem to your Gemfile:

    gem 'wurl_engine'

Use the built-in rake tasks to copy the migrations to your app and migrate your db:

    rake wurl_engine:install:migrations
    rake db:migrate

Then in your main app's routes.rb file, add this to make the wurl_engine routable:

    mount WurlEngine::Engine => "/wurl", :as => "wurl_engine"

Finally, look at your new API playground by starting your rails server and hitting up the right URL:

    http://localhost:3000/wurl

## Customize Wurl to Match Your Application

Rails Mountable Engines make it easy to override or extend many parts of Wurl.
If you need to override a method, view or partial, create the corresponding file in your
main app directory and it will be used instead.

* Controllers & Helpers: See Engines::RailsExtensions::Dependencies for more information.
* Views: now handled almost entirely by ActionView itself (see Engines::Plugin#add_plugin_view_paths for more information)

For instance, you may want to change the overall presentation layout of Wurl to match your app.
To do so, simply create a new application.html.haml in the corresponding directory your main app:

    _ my-app
    \_ app
      \_ views
        \_layouts
          \_ wurl_engine
            \_ application.html.haml

Wurl is inspired by [hurl](http://hurl.it/), and the [Apigee Console](https://apigee.com/console/)
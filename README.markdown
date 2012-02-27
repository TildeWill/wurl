# Whurl

An API Playground.

* Great for demonstrating an API's functionality
* Useful for doing story acceptance when developing an API
* Gives pretty-printed output and the browser saves your input making it easy to reuse

## Installation

Add the whurl_engine gem to your Gemfile:

    gem 'whurl_engine'

Use the built-in rake tasks to copy the migrations to your app and migrate your db:

    rake whurl_engine:install:migrations
    rake db:migrate

Then in your main app's routes.rb file, add this to make the whurl_engine routable:

    mount WhurlEngine::Engine => "/whurl", :as => "whurl_engine"

Figure out how you want to authorize users for setting up the documentation vs. viewing it. Whurl
comes with a default CanCan adapter. To us it install the cancan gem in your app and add a new whurl.rb to config/initializers:

    WhurlEngine.config do |config|
        config.current_user_method { current_user }
        config.authorize_with(:cancan)
    end

...and your ability.rb file looks like this:

```ruby
class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user (not logged in)
        if user.admin?
            can :manage, :all
        else
            can :read, :all
            can :access, :whurl_engine
            can :create, WhurlEngine::Whurl
        end
    end
end
```

Finally, look at your new API playground by starting your rails server and hitting up the right URL:

    http://localhost:3000/whurl

## Customize Whurl to Match Your Application

Rails Mountable Engines make it easy to override or extend many parts of Whurl.
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

Whurl is inspired by [hurl](http://hurl.it/), and the [Apigee Console](https://apigee.com/console/)
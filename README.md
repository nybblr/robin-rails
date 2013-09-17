[![Gem Version](https://badge.fury.io/rb/robin-rails.png)](http://badge.fury.io/rb/robin-rails)
[![Dependency Status](https://gemnasium.com/nybblr/robin-rails.png)](https://gemnasium.com/nybblr/robin-rails)
[![Code Climate](https://codeclimate.com/github/nybblr/robin-rails.png)](https://codeclimate.com/github/nybblr/robin-rails)
[![Coverage Status](https://coveralls.io/repos/nybblr/robin-rails/badge.png?branch=master)](https://coveralls.io/r/nybblr/robin-rails)
[![Build Status](https://travis-ci.org/nybblr/robin-rails.png)](https://travis-ci.org/nybblr/robin-rails)

Robin.js on Rails
=================

Every Batman.js app on Rails needs a sidekick. Bring realtime to the fight with Robin.js.

Usage
=====

For client-side info on Robin.js, [checkout the CoffeeScript source.](https://github.com/nybblr/robin)

Vendoring
---------

The latest version of the client-side Robin.js source is available through the asset pipeline under the `robin` namespace.

~~~coffeescript
# app/assets/javascripts/application.js.coffee
#
#= require batman/es5-shim
#= require batman/batman
#= require batman/batman.rails
#= require batman/batman.jquery
#
#= require robin/robin
#= require robin/reactor
~~~

Make sure you load Robin after the Batman source files.

Realtime
--------

The easiest way to get started is to add Robin to your Gemfile:

~~~ruby
gem 'robin-rails' # Robin.js vendor and Rails events
gem 'faye' # websocket backend
~~~

For every model you want to update in realtime, include the `Robin::Rails` module.

~~~ruby
class Post < ActiveRecord::Base
  include Robin::Rails
end
~~~

You can configure the Faye endpoint in an initializer.

~~~ruby
# config/initializers/robin.rb
Robin.configure do |config|
  config.faye_url = 'http://localhost:9292/faye' # the default
end
~~~

That's it! Anytime a record is created, updated, or destroyed, the event will immediately be pushed to Robin.js subscribers via Faye. If you've got Faye running correctly (e.g. make sure you use Thin or another EventMachine friendly server), you should now be able to open several browser clients, edit models in the JS console, then watch the events propagate to other subscribed clients!

Contributing
============
This project is (obviously) in its infancy with just the basics. TODO lists a bunch of features I hope to get implemented, but this is GitHub: if you add a feature on your own, give me a hand and contribute!

No guidelines yet other than your basics: fork it, submit a pull request with relevant tests, and try to follow the conventions already in the code. Any and all quality contributions welcome!

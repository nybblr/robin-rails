source 'https://rubygems.org'

# Specify your gem's dependencies in robin-rails.gemspec
gemspec

group :test do
  gem 'coveralls', :require => false

  platforms :ruby do
    gem 'sqlite3'
  end

  platforms :jruby do
    gem 'json'
    gem 'activerecord-jdbcsqlite3-adapter'
  end
end


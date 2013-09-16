# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'robin/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "robin-rails"
  spec.version       = Robin::Rails::VERSION
  spec.authors       = ["Jonathan Martin"]
  spec.email         = ["me@nybblr.com"]
  spec.description   = %q{Every Batman.js app on Rails needs a sidekick. Bring realtime to the fight with Robin.js.}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = "https://github.com/nybblr/robin-rails"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 1.8.7'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 4.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
end

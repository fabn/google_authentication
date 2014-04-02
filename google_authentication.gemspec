# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_authentication/version'

Gem::Specification.new do |spec|
  spec.name          = 'google_authentication'
  spec.version       = GoogleAuthentication::VERSION
  spec.authors       = ['Fabio Napoleoni']
  spec.email         = %w(f.napoleoni@gmail.com)
  spec.description   = %q{Authenticate users through Google in your app using devise and omniauth}
  spec.summary       = %q{Authenticate users through Google in your app}
  spec.homepage      = 'http://github.com/fabn/google_authentication'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # gem runtime requirements
  spec.add_dependency 'rails', '>= 3.1.0'
  spec.add_dependency 'omniauth', '>= 1.0'
  spec.add_dependency 'omniauth-google-apps'
  spec.add_dependency 'devise', '>= 2.0'

  # dev dependencies
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sqlite3', '~> 1.3.5'
  spec.add_development_dependency 'rspec-rails', '>= 2.9.0'
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'generator_spec', '>= 0.8.5'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'capybara', '>= 0.4.0'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'aruba', '~> 0.5.4'
  spec.add_development_dependency 'appraisal'

end

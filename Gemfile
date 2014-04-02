source 'https://rubygems.org'

# Specify your gem's dependencies in google_authentication.gemspec
gemspec

group :test do
  if RUBY_PLATFORM.downcase.include?('darwin') # I'm on Mac
    gem 'rb-fsevent'
    gem 'growl'
  end
end

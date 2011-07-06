source "http://rubygems.org"

gem 'rails', '>= 3.0.0'
gem 'omniauth' # This MUST be before devise
gem 'devise', '>= 1.2.0'

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
group :development do
  gem "sqlite3"
  gem "rspec-rails"
  gem "generator_spec"
  gem "guard-rspec"
  gem "capybara", ">= 0.4.0"
  gem "yard"
  gem "cucumber", "~> 0.10"
  gem "aruba"
  gem "bundler", "~> 1.0.0"
  gem "jeweler", "~> 1.6.2"
end

group :test do
  if RUBY_PLATFORM.downcase.include?("darwin") # I'm on Mac
    gem "rb-fsevent"
    gem "growl"
  end
end

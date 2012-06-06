source "http://rubygems.org"

gem 'rails', '>= 3.1.0'
gem 'omniauth', '>= 1.0'
gem 'omniauth-google-apps'
gem 'devise', '>= 2.0'

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
group :development do
  gem "sqlite3", '~> 1.3.5'
  gem "rspec-rails", '>= 2.9.0'
  gem "shoulda-matchers"
  gem "generator_spec", '>= 0.8.5'
  gem "guard-rspec"
  gem "capybara", ">= 0.4.0"
  gem "yard"
  gem "cucumber", "~> 0.10"
  gem "aruba"
  gem "bundler"
  gem "jeweler", "~> 1.6.2"
end

group :test do
  if RUBY_PLATFORM.downcase.include?("darwin") # I'm on Mac
    gem "rb-fsevent"
    gem "growl"
  end
end

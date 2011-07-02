Given /^a rails application named "([^\"]*)" exists$/ do |app_name|
  @app_name = app_name
  Given "I successfully run `rails new #{app_name}`"
  And "I cd to \"#{app_name}\""
end

When /^this gem is installed in that application$/ do
  gempath = File.expand_path('../../../', __FILE__)
  Given "I append to \"Gemfile\" with \"gem 'google_authentication', :path => '#{gempath}'\""
  And "I successfully run `bundle check`"
end

When /^I generate the model with "([^\"]*)" as argument$/ do |model_name|
  Given "I successfully run `rails generate google_authentication:install`"
  And "I successfully run `rails generate google_authentication #{model_name}`"
  And "I successfully run `rake db:migrate`"
end

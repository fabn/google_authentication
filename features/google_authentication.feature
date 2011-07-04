Feature: Create a new application
  In order to use google_authentication gem
  A user should create a new rails application and install the gem and run the generator

  Background: A new rails application has been created with google_authentication gem
    Given a rails application named "google_app" exists
    And this gem is installed in that application

  @announce
  Scenario: Installation using default values
    When I successfully run `rails generate google_authentication:install`
    # this is needed because rails g returns 0 when can't find the generator
    And the output should not contain "Could not find generator"
    Then a file named "config/initializers/devise.rb" should exist
    And the file "config/initializers/google_authentication.rb" should contain "# config.domain = 'gmail.com'"
    And the file "config/initializers/google_authentication.rb" should contain "# config.model_name = :user"

  Scenario: Installation with model generation and default values
    When I generate the model with "" as argument
    Then the file "app/models/user.rb" should contain "acts_as_google_user"
    And the file "db/schema.rb" should contain "users"

  Scenario: Installation with different model name
    When I generate the model with "account" as argument
    Then the file "app/models/account.rb" should contain "acts_as_google_user"
    And the file "config/initializers/google_authentication.rb" should contain "config.model_name = :account"
    And the file "db/schema.rb" should contain "accounts"

require 'devise'
require 'google_authentication/acts_as_google_user'

# Main module for the gem
module GoogleAuthentication

  # domain configuration
  mattr_accessor :domain
  # default value for google domain used for authentication
  @@domain = "gmail.com"

  # model name configuration
  mattr_accessor :model_name
  # default model used (singular name)
  @@model_name = :user

  # Allows config in initializer
  # @yield [self] Allows config in initializer using the same syntax as Devise
  # @yieldparam [GoogleAuthentication] config the module itself
  # @example Changing the authentication setup
  #   GoogleAuthentication.setup do |config|
  #     config.domain = 'your-google-apps-domain.com'
  #     config.model_name = :account
  #   end
  def self.setup
    yield self
  end

  # Used in the routes file to decide wheter to add routes
  # to the application
  # @return [bool] true iff the GoogleAuthentication model is already defined
  def self.define_routes?
    begin
      Object.const_get(model_name.to_s.camelize)
    rescue NameError
      return false
    end
    return true
  end

  # Return a symbol which is used to build devise routes
  # @return [Symbol] a symbol representing the table name used by devise
  def self.devise_table
    model_name.to_s.pluralize.to_sym
  end

  # require the engine if rails is defined
  require 'google_authentication/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end

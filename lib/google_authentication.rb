require 'google_authentication/acts_as_google_user'

module GoogleAuthentication

  # domain configuration
  mattr_accessor :domain
  # default value for google domain used for authentication
  @@domain = "gmail.com"

  # model name configuration
  mattr_accessor :model
  # default model used (singular name)
  @@model = :user

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

  # require the engine if rails is defined
  require 'google_authentication/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end

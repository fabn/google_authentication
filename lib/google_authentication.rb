module GoogleAuthentication

  # domain configuration
  mattr_accessor :domain
  # default value for google domain used for authentication
  @@domain = "gmail.com"

  # Allows config in initializer
  # @yield [self] Allows config in initializer using the same syntax as Devise
  # @yieldparam [GoogleAuthentication] config the module itself
  # @example Changing the authentication domain
  #   GoogleAuthentication.setup do |config|
  #     config.domain = 'your-google-apps-domain.com'
  #   end
  def self.setup
    yield self
  end

  # require the engine if rails is defined
  require 'google_authentication/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end

module GoogleAuthentication

  # domain configuration
  #mattr_accessor :domain
  #@@domain = "gmail.com"

  require 'google_authentication/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end

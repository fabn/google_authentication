require 'google_authentication'

require 'rails'
require 'action_controller'

require 'omniauth'
require 'omniauth-google-apps'
require 'devise'

module GoogleAuthentication
  # rails engine to add controllers, routes and configuration needed to the gem
  class Engine < Rails::Engine

    # Initialize devise configuration for omniauth
    initializer "google_authentication.domain", :before => "devise.omniauth" do
      require 'openid/store/filesystem'
      Devise.omniauth :google_apps, :store => OpenID::Store::Filesystem.new('/tmp'), :domain => GoogleAuthentication.domain
    end
  end
end

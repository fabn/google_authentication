class GoogleAuthentication::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  unloadable

  # callback called by devise on successful authentication
  def google_apps
    @resource = resource_class.find_or_create_by_omniauth_impl(request.env["omniauth.auth"])
    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
    sign_in_and_redirect @resource, :event => :authentication
  end
end

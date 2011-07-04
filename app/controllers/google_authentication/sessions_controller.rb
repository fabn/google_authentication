class GoogleAuthentication::SessionsController < Devise::SessionsController

  unloadable

  # send user to google apps page for authentication
  def new
    redirect_to (send "#{resource_name}_omniauth_authorize_path", :google_apps)
  end

end

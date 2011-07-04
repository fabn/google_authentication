Rails.application.routes.draw do

  if GoogleAuthentication.define_routes?
    # Devise + omniauth routes only if the given class exist
    devise_for GoogleAuthentication.devise_table, :controllers => {:omniauth_callbacks => "google_authentication/omniauth_callbacks"} do
      get 'sign_in', :to => 'google_authentication/sessions#new', :as => :new_user_session
      get 'sign_out', :to => 'google_authentication/sessions#destroy', :as => :destroy_user_session
    end
  end

end

Rails.application.routes.draw do

  if defined?(GoogleAuthentication.model_name.constantize) || Rails.env.test?
    # Devise + omniauth routes only if the given class exist
    devise_for GoogleAuthentication.model_name.to_s.pluralize.to_sym, :controllers => {:omniauth_callbacks => "google_authentication/omniauth_callbacks"} do
      get 'sign_in', :to => 'google_authentication/sessions#new', :as => :new_user_session
      get 'sign_out', :to => 'google_authentication/sessions#destroy', :as => :destroy_user_session
    end
  end

end

Rails.application.routes.draw do

  # Devise + omniauth routes
  devise_for GoogleAuthentication.model_name.to_s.pluralize.to_sym, :controllers => {:omniauth_callbacks => "google_authentication/omniauth_callbacks"} do
    get 'sign_in', :to => 'google_authentication/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'google_authentication/sessions#destroy', :as => :destroy_user_session
  end

end

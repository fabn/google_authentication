class User < ActiveRecord::Base
  # provides finder methods for retrieving users by the given omniauth
  acts_as_google_user

end

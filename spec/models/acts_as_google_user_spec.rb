require 'spec_helper'

describe GoogleAuthentication::ActsAsGoogleUser do

  class User1
    acts_as_google_user
  end

  describe User1 do
    User1.new.should respond_to? :foo_method
  end

end

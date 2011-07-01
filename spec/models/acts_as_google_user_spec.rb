require 'spec_helper'

describe GoogleAuthentication::ActsAsGoogleUser do

  class User < ActiveRecord::Base
    acts_as_google_user
  end

  describe User do
    it "should respond to a class method finder" do
      User.respond_to?(:find_or_create_by_omniauth_uid).should be_true
    end
  end

end

require 'spec_helper'

describe GoogleAuthentication::ActsAsGoogleUser do

  class DefaultUser < ActiveRecord::Base
    set_table_name :users
    acts_as_google_user
  end

  class RememberableUser < ActiveRecord::Base
    set_table_name :users
    acts_as_google_user :rememberable
  end

  class ForbiddenUser < ActiveRecord::Base
    set_table_name :users
    acts_as_google_user :database_authenticable, :recoverable
  end

  # all kind of users should include :omniauthable module
  shared_examples_for "All Users" do
    it "should have omniauthable module" do
      subject.class.devise_modules.should include(:omniauthable)
    end
  end

  describe DefaultUser do

    subject { DefaultUser.new }

    it_should_behave_like "All Users"

    it "should respond to a class method finder" do
      subject.class.respond_to?(:find_or_create_by_omniauth_uid).should be_true
    end

    it "should have only omniauthable module" do
      subject.class.devise_modules.should eql [:omniauthable]
    end
  end

  describe "Users with different devise modules" do

    describe RememberableUser do

      subject { RememberableUser.new }

      it_should_behave_like "All Users"

      it "should have rememberable module" do
        subject.class.devise_modules.should include :rememberable
      end
    end

    describe ForbiddenUser do
      subject { ForbiddenUser.new }

      it_should_behave_like "All Users"

      it "should not include forbidden modules" do
        subject.class.devise_modules.should eql [:omniauthable]
      end
    end

  end

end

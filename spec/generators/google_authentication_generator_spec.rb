require 'spec_helper'

require File.expand_path('../../../lib/generators/google_authentication/google_authentication_generator', __FILE__)

describe GoogleAuthentication::Generators::GoogleAuthenticationGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../../tmp", __FILE__)

  before(:each) do
    prepare_destination
  end

  it "should create a migration and a model file" do
    run_generator %w(monster)
    assert_file "app/models/monster.rb", /acts_as_google_user/
    assert_migration "db/migrate/devise_create_monsters.rb"
  end

  it "should delete all files when revoked" do
    run_generator %w(monster)
    run_generator %w(monster), :behavior => :revoke
    assert_no_file "app/models/monster.rb"
    assert_no_migration "db/migrate/devise_create_monsters.rb"
  end
end

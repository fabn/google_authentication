require 'spec_helper'

require File.expand_path('../../../lib/generators/google_authentication/install_generator', __FILE__)

describe GoogleAuthentication::Generators::InstallGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
  end

  it "creates an initializer file" do
    assert_file "config/initializers/google_authentication.rb", /GoogleAuthentication.setup do |config|/
    assert_file "config/initializers/devise.rb", /Devise.setup do |config|/
  end
end

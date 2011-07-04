require 'spec_helper'

require File.expand_path('../../../lib/generators/google_authentication/install_generator', __FILE__)

describe GoogleAuthentication::Generators::InstallGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../../tmp", __FILE__)

  before(:each) do
    prepare_destination
  end

  it "creates an initializer file" do
    run_generator
    assert_file "config/initializers/google_authentication.rb", /GoogleAuthentication.setup do |config|/
    assert_file "config/initializers/devise.rb", /Devise.setup do |config|/
  end

  it "accept an option for domain and put it in the initializer file" do
    run_generator %w(--domain domain.com)
    assert_file "config/initializers/google_authentication.rb", /config\.domain = 'domain\.com'/
  end
end

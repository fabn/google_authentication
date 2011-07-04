
module GoogleAuthentication
  module Generators # :nodoc:
    class InstallGenerator < Rails::Generators::Base # :nodoc:
      source_root File.expand_path("../../templates", __FILE__)

      desc "Create an initializer for GoogleAuthentication gem and install devise (replace devise:install)"

      class_option :domain, :desc => 'Google(Apps) domain used for authentication', :default => 'gmail.com', :type => :string

      # Copy the initializer template in the config/initializer directory
      def copy_initializer
        template "google_authentication.rb", "config/initializers/google_authentication.rb"
      end

      # Run devise:install generator
      def install_devise
        invoke "devise:install"
      end

      # Show the readme file with further instructions after installation
      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end

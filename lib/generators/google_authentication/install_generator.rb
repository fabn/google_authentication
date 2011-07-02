
module GoogleAuthentication
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Create an initializer for GoogleAuthentication gem and install devise (replace devise:install)"

      class_option :domain, :desc => 'Google(Apps) domain used for authentication', :default => 'gmail.com', :type => :string

      def copy_initializer
        template "google_authentication.rb", "config/initializers/google_authentication.rb"
      end

      def install_devise
        invoke "devise:install"
      end

      def show_readme
        #readme "README"
      end
    end
  end
end

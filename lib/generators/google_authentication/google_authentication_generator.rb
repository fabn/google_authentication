require 'rails/generators/active_record'
require 'generators/devise/orm_helpers'

module GoogleAuthentication
  module Generators
    class GoogleAuthenticationGenerator < ActiveRecord::Generators::Base
      namespace "google_authentication"
      source_root File.expand_path("../../templates", __FILE__)

      # include some helpers from devise
      include Devise::Generators::OrmHelpers

      # accept same arguments as devise generator with google tuned defaults
      argument :attributes, :type => :array, :default => ['first_name:string', 'last_name:string'], :banner => "field:type field:type"

      desc "Generates a model with the given NAME with google_authentication " <<
           "configuration plus a migration file which create it."

      def generate_model
        invoke "active_record:model", [name], :migration => false unless model_exists? && behavior == :invoke
      end

      def copy_devise_migration
        migration_template "migration.rb", "db/migrate/devise_create_#{table_name}"
      end

      def inject_google_authentication_content
        inject_into_class(model_path, class_name) do
          return nil unless model_exists?
          "# You can add other devise modules here as arguments (except :database_authenticable)\n" <<
          "# if you do that, remember to edit the generated migration\n" <<
          "acts_as_google_user\n"
        end
      end
    end
  end
end

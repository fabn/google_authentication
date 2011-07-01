module GoogleAuthentication

  module ActsAsGoogleUser

    # Configure a model to be used with devise and google authentication
    # @param [Array] modules a list of symbols used with a devise call
    def acts_as_google_user *modules
      # assign devise modules to module variable
      Model.devise_modules = modules unless modules.empty?
      # include model methods
      include ActsAsGoogleUser::Model
    end

    # Models method added to an AR class which calls acts_as_google_user
    module Model

      # Devise module to include in included classes
      mattr_accessor :devise_modules
      # default devise modules
      @@devise_modules = [:omniauthable]

      extend ActiveSupport::Concern

      # send devise methods and attr_accessible to the base class
      included do
        # remove database authenticable if given
        devise *(Model.devise_modules.select {|m| m != :database_authenticable})
        # restore default value for devise_modules, don't know if needed
        Model.devise_modules = [:omniauthable]
        # Setup accessible (or protected) attributes for your model
        attr_accessible :email
      end

      module ClassMethods # :nodoc:
        # Find omniauth given user or create it
        # @param [Hash] omniauth_data omniauth returned hash
        def find_or_create_by_omniauth_impl omniauth_data
          # use custom implementation if given by the user
          respond_to?(:find_or_create_by_omniauth) ?
              send(:find_or_create_by_omniauth, omniauth_data) :
              find_or_create_by_omniauth_default_impl(omniauth_data)
        end

        private

        # default implementation of find_or_create_by_omniauth_uid
        # find the user with the given omniauth_uid or create it
        # assign all properties found in user_info hash to instance
        # and return it
        # @param [Hash] omniauth_data omniauth returned hash
        # @return [ActiveRecord::Base] an instance of the base class
        def find_or_create_by_omniauth_default_impl omniauth_data
          find_or_initialize_by_omniauth_uid(omniauth_data['uid']).tap do |user|
            omniauth_data['user_info'].each do |k, v|
              user.send "#{k}=", v if user.respond_to? "#{k}="
            end
            user.save!
          end
        end
      end
    end
  end
end

# make AR extend the module ActsAsGoogleUser
ActiveRecord::Base.send :extend, GoogleAuthentication::ActsAsGoogleUser

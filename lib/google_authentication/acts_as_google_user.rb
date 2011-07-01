module GoogleAuthentication


  module ActsAsGoogleUser


    # Configure a model to be used with devise
    # @param [Array] args a list of symbols used
    def acts_as_google_user *args
      # foo
      include ActsAsGoogleUser::Model
    end

    # Provides methods for storing google users in AR
    module Model # :nodoc:
      extend ActiveSupport::Concern

      module ClassMethods # :nodoc:
        # Find omniauth given user or create it
        # @param [Hash] omniauth_data omniauth returned hash
        def find_or_create_by_omniauth omniauth_data
          find_or_initialize_by_omniauth_uid(omniauth_data['uid']).tap do |user|
            omniauth_data['user_info'].each do |k, v|
              user.send "#{k}=", v if user.respond_to? "#{k}="
            end
            user.save!
          end
        end
      end

      module InstanceMethods
        def foo_method
          'foo'
        end
      end
    end
  end
end

# make AR extend the module ActsAsGoogleUser
ActiveRecord::Base.send :extend, GoogleAuthentication::ActsAsGoogleUser

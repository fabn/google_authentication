# google_authentication with devise + omniauth

[![Build Status](https://secure.travis-ci.org/fabn/google_authentication.png)](http://travis-ci.org/fabn/google_authentication) [![Gem Version](https://badge.fury.io/rb/google_authentication.svg)](http://badge.fury.io/rb/google_authentication)

I found myself using Google authentication in a lot of projects (especially private projects which require google apps
authentication). With Omniauth it's pretty simple to authenticate against Google and Devise has a lot of convenient helpers.

But if you need to use Devise with a model which is only `:omniauthable` you'll have to do a lot of configuration to make
 it working, as you can see [here](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview). Essentially you need
 to define custom routes, a callbacks controller for processing Omniauth responses and a sessions controller because
 you can't use Devise one if your model is only `:omniauthable`.

I'm studying Rails Engines, so this gem is my first attempt with them. I tried to build all the needed stuff in a gem to
 develop an out-of-the-box solution for Google authentication based on devise + omniauth. This gem is the result.

## Hello world Google

This is the minimal configuration in order to use google as authenticator for your projects

    rails new google_app
    gem 'google_authentication' # in your Gemfile
    bundle install
    rails g google_authentication:install # this will also install devise in your app
    rails g google_authentication user    # this will generate a model and it will enable devise routes for it
    rake db:migrate

No other steps are needed, you have a working google application. You can use all the devise helpers and routes in your
app, with no further configuration.

## A deeper look

To use the gem the mandatory steps are pretty standard

    gem 'google_authentication' # in your Gemfile

Then (after the `bundle install` command) you must install devise and google_authentication initializers in the app with
 the command

    rails g google_authentication:install # this will also install devise in your app

As far as the model defined in the `:model_name` config parameter doesn't exist the gem (and devise itself) is invisible
 to your app.

You can use the given generator to create a Google authenticable model with

    rails g google_authentication user    # this will generate a model and it will enable devise routes for it
    rake db:migrate

These commands will (indirectly) activate the gem routes by defining the `User` class. The generated model contains an
 `acts_as_google_user` call which activates devise features for that model.

At this point you can start using devise methods, helpers and filters in your app, something like this piece of code in
 your views (or layout)

    <% if current_user %>
        <p>Currently logged in as <strong><%= current_user.email %></strong></p>
    <% else %>
        <p>You're not logged in, <%= link_to 'Login', user_omniauth_authorize_path(:google_apps) %></p>
    <% end %>

If you want to add Google authentication to an existing model you'll have to add an `acts_as_google_user` call in it and
 you need to generate a migration which creates required fields with

    rails g migration add_google_authentication_to_user email:string omniauth_uid:string

Which creates a migration like this one

    class AddGoogleAuthenticationToUser < ActiveRecord::Migration
      def self.up
        add_column :users, :email, :string
        add_column :users, :omniauth_uid, :string
      end

      def self.down
        remove_column :users, :omniauth_uid
        remove_column :users, :email
      end
    end

You may still need to edit the generated migration to add other devise fields if you use other devise modules.
 See [this wiki page](https://github.com/plataformatec/devise/wiki/How-To:-change-an-already-existing-table-to-add-devise-required-columns) and below

## Configuration and Customization

At this stage my gem has only 2 configurable params: `domain` and `model_name`. You can configure them in the initializer
 created by the install generator.

* **domain:** it tell the gem which google domain it should use to authenticate users
* **model_name:** it tell the gem which model should be authenticated with Google

## Model creation and retrieval

When returning from google auth page to your app gem's callback controller is invoked and it search for an existing user
 with the given `omniauth_uid`. If he can't be found it creates it and sign in him. If the user already exist it will
 update its fields with omniauth returned ones.

This (pretty simple) logic is implemented in the `acts_as_google_user` behavior and it can be customized as you wish.

To replace the default finder just define a class method in you model named `find_or_create_by_omniauth` and it will be
 called in the callback controller to retrieve or create the users. This method will be invoked with the full omniauth hash
 returned by omniauth gem. With the current omniauth implementation it will contain the following values

* `provider` (required) - The provider with which the user authenticated (i.e. 'google_apps')
* `uid` (required) - An identifier unique to the given provider. Should be used as unique identifier for your users, stored as a string.
* `user_info` (required) - A hash containing information about the user
  * `name` (required) - The best display name known to the strategy. Usually a concatenation of first and last name.
  * `email` - The e-mail of the authenticating user.
  * `first_name`
  * `last_name`

## Integration with other devise modules

Models used in this gem may use other devise modules in a transparent way, just pass devise modules to the `acts_as_google_user`
 call. However I've excluded some modules because they're useless in this context, so you can not pass any of them to the call.
 These are the devise modules you can use in your models:

    class User < ActiveRecord::Base
      # :omniauthable is obviously included by default even if you don't list it
      acts_as_google_user :omniauthable, :token_authenticable, :trackable, :timeoutable, :rememberable
    end

## Contributing to google_authentication

I'm using the [gitflow model](https://github.com/nvie/gitflow) to maintain this gem, so all the development stuff is in
 the develop branch, master will contain only stable code.

* Check out the latest develop to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Fabio Napoleoni. See LICENSE.txt for
further details.


require 'spec_helper'

describe "Navigation" do
  include Capybara::DSL
  
  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end

  it 'should redirect to auth path when requesting sign_in' do
    get '/sign_in'
    response.should be_redirect
  end

  it 'should sign in and redirect with a flash message when calling callback' do
    User.stub(:find_or_create_by_omniauth).and_return(User.new)
    get '/users/auth/google_apps/callback'
    response.should be_redirect
    flash[:notice].should match('Google')
  end

end

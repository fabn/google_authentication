require 'spec_helper'

describe GoogleAuthentication do
  it "should be valid" do
    GoogleAuthentication.should be_a(Module)
  end

  describe "#define_routes?" do

    it "should return true with existent class" do
      # User model is defined in the dummy application
      GoogleAuthentication.stub(:model_name).and_return(:user)
      GoogleAuthentication.define_routes?.should be_true
    end

    it "should return false with non existent class" do
      GoogleAuthentication.stub(:model_name).and_return(:monster)
      GoogleAuthentication.define_routes?.should be_false
    end
  end

  describe "#devise_table" do
    it "should return a plural symbol" do
      GoogleAuthentication.stub(:model_name).and_return(:monster)
      GoogleAuthentication.devise_table.should eql(:monsters)
    end
  end
end
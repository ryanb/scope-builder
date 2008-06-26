require File.dirname(__FILE__) + '/../spec_helper'

class Product < ActiveRecord::Base
  named_scope :released
end

describe ScopeBuilder::Builder do
  before(:each) do
    @builder = Product.scope_builder
  end
  
  it "should start with empty proxy options" do
    @builder.proxy_options.should == {}
  end
  
  it "should allow named scopes to be called through it" do
    @builder.released.proxy_options.should == Product.released.proxy_options
  end
end

require File.dirname(__FILE__) + '/../spec_helper'

describe ScopeBuilder::ModelAdditions do
  it "should pass self and empty hash to builder initializer" do
    ScopeBuilder::Builder.expects(:new).with(ActiveRecord::Base, {})
    ActiveRecord::Base.scope_builder
  end
end

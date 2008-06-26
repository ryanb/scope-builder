require File.dirname(__FILE__) + '/../spec_helper'

describe ScopeBuilder::ModelAdditions do
  it "should add sope_builder to ActiveRecord::Base which returns a ScopeBuilder::Builder class" do
    ActiveRecord::Base.scope_builder.should be_kind_of(ScopeBuilder::Builder)
  end
end

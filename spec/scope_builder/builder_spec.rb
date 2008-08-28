require File.dirname(__FILE__) + '/../spec_helper'

describe ScopeBuilder::Builder do
  before(:each) do
    Product.delete_all
    Product.create!(:name => 'a', :released => true)
    Product.create!(:name => 'b', :released => false)
    Product.create!(:name => 'c', :released => true)
    
    @builder = Product.scope_builder
  end
  
  it "should start with empty proxy options" do
    @builder.proxy_options.should == {}
  end
  
  it "should allow named scopes to be called through it" do
    @builder.released.proxy_options.should == Product.released.proxy_options
  end
  
  it "should remember scope calls" do
    @builder.released
    @builder.proxy_options.should == Product.released.proxy_options
  end
  
  it "should build up scopes" do
    @builder.released.scoped(:limit => 1)
    @builder.scoped(:offset => 1)
    @builder.all.should == Product.released.scoped(:limit => 1, :offset => 1).all
  end
  
  it "should enumerate like an array" do
    products = Product.find(:all)
    @builder.each_with_index do |product, index|
      product.should == products[index]
    end
  end
  
  it "should not include instance variables on inspect so it doesn't load proxy" do
    @builder.inspect.should_not include('proxy_scope')
  end
  
  it "should respond to enumerable methods like each_with_index" do
    @builder.should respond_to(:each_with_index)
  end
  
  it "should be able to build up scope in block" do
    Product.scope_builder { |b| b.released }.all.should == Product.released.all
  end
  
  it "should be able to call scope builder on an existing scope" do
    builder = Product.released.scope_builder
    builder.all.should == Product.released.all
  end
  
  describe "products in category" do
    before(:each) do
      Category.delete_all
      @category = Category.create!(:products => Product.find_all_by_name(['a', 'b']))
    end
    
    it "should work on named scope through association" do
      builder = @category.products.released.scope_builder
      builder.all.should == @category.products.released.all
    end
    
    it "should work directly on assocation" do
      builder = @category.products.scope_builder
      builder.released
      builder.all.should == @category.products.released.all
    end
  end
end

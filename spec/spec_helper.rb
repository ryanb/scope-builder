require 'rubygems'
require 'spec'
require 'active_support'
require 'active_record'
require File.dirname(__FILE__) + '/../lib/scope_builder.rb'

# setup database adapter
ActiveRecord::Base.establish_connection({
  :adapter => "sqlite3", 
  :dbfile => File.dirname(__FILE__) + "/test.sqlite3" 
})

class Product < ActiveRecord::Base
  named_scope :released, :conditions => ['released=?', true]
end

Spec::Runner.configure do |config|
  config.mock_with :mocha
end

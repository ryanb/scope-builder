require 'rubygems'
require 'rake'
require 'echoe' 

Echoe.new('scope-builder', '0.1.2') do |p|
  p.summary        = "Build up named scopes conditionally."
  p.description    = "Build up named scopes conditionally."
  p.url            = "http://github.com/ryanb/scope-builder"
  p.author         = 'Ryan Bates'
  p.email          = "ryan (at) railscasts (dot) com"
  p.ignore_pattern = ["script/*", "**/*.sqlite3"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

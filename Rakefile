require 'rubygems'
require 'rake'
 
begin
  require 'echoe'

  Echoe.new('scope-builder', '0.1.0') do |p|
    p.summary        = "Build up named scopes conditionally."
    p.description    = "Build up named scopes conditionally."
    p.url            = "http://github.com/ryanb/scope-builder"
    p.author         = 'Ryan Bates'
    p.email          = "ryan (at) railscasts (dot) com"
    p.ignore_pattern = ["script/*"]
  end

rescue LoadError => boom
  puts "You are missing a dependency required for meta-operations on this gem."
  puts "#{boom.to_s.capitalize}."
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

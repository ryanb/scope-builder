module ScopeBuilder
  module ModelAdditions
  end
end

class ActiveRecord::Base
  include ScopeBuilder::ModelAdditions
end

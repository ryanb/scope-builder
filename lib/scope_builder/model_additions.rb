module ScopeBuilder
  module ModelAdditions
    def scope_builder
      Builder.new(scoped({}))
    end
  end
end

class ActiveRecord::Base
  extend ScopeBuilder::ModelAdditions
end

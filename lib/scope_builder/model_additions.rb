module ScopeBuilder
  module ModelAdditions
    def scope_builder
      Builder.new(self, {})
    end
  end
end

class ActiveRecord::Base
  extend ScopeBuilder::ModelAdditions
end

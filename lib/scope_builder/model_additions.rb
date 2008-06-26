module ScopeBuilder
  module ModelAdditions
    def scope_builder
      builder = Builder.new(scoped({}))
      yield(builder) if block_given?
      builder
    end
  end
end

class ActiveRecord::Base
  extend ScopeBuilder::ModelAdditions
end

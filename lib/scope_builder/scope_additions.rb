module ScopeBuilder
  module ScopeAdditions
    def scope_builder
      builder = Builder.new(self)
      yield(builder) if block_given?
      builder
    end
  end
end

class ActiveRecord::NamedScope::Scope
  include ScopeBuilder::ScopeAdditions
end

module ScopeBuilder
  class Builder
    def initialize(proxy_scope)
      @proxy_scope = proxy_scope
    end
    
    def method_missing(method, *args, &block)
      result = @proxy_scope.send(method, *args, &block)
      if result.class == ActiveRecord::NamedScope::Scope
        @proxy_scope = result
        self
      else
        result
      end
    end
  end
end

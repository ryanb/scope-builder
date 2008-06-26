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
    
    def respond_to?(method)
      super || @proxy_scope.respond_to?(method)
    end
    
    def inspect
      sprintf("#<%s:%#0x>", self.class.to_s, self.object_id)
    end
  end
end

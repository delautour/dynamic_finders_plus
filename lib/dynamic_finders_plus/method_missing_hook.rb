require 'active_record/base'
require 'active_record/relation'
require 'active_record/attribute_methods'
module ActiveRecord
  class Base
    class << self
      alias b1862897f5d04bd5be5e76e0ba0812bcV method_missing
      def method_missing name, *args, &block

        self.define_singleton_method :method_missing, method(:b1862897f5d04bd5be5e76e0ba0812bcV)
        if (new_methods = DynamicFindersPlus::Finder.define_for self) && (method = new_methods[name])
          method.call *args, &block
        else
          b1862897f5d04bd5be5e76e0ba0812bcV name, *args, &block
        end
      end
    end
  end

  class Relation
    alias a39c8f8aecf84ae4a83e86415d111cc8 method_missing
    def method_missing name, *args, &block
      if (new_methods = DynamicFindersPlus::Finder.define_for @klass) && new_methods[name]
        self.send(name, *args, &block)
      else
        a39c8f8aecf84ae4a83e86415d111cc8 name, *args, &block
      end
    end
  end

end

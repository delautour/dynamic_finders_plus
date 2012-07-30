module DynamicFindersPlus
  class Finder

    def self.wrap object
      if object.nil?
        []
      elsif object.respond_to?(:to_ary)
        object.to_ary || [object]
      else
        [object]
      end
    end

    def self.finder (types, name_lambda, body_lambda=nil, &body_block)
      body_lambda ||= body_block.to_proc
      wrap(types).each do |type|
        type= type.to_sym
        finders[type] ||= Set.new
        finders[type] << [name_lambda, body_lambda]
      end
    end

    def self.define_for klass
      return nil unless defined.add? klass
      return if klass.abstract_class

      results = {}
      klass.columns.each do |column|
        (finders[column.type] || []).each do |name_l, body|
          wrapped= ->(*args) do
            args.insert(0, klass, column);
            body.call *args
          end

          name = name_l.(column)
          method = klass.define_singleton_method name, &wrapped
          results[name.to_sym] = method
        end
      end
      results
    end

    def self.defined
      @@defined ||= Set.new
    end

    def self.finders
      @@finders ||= {}
    end
  end
end

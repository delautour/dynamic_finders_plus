module DynamicFindersPlus
  class Finder

    def self.finder (types, name_lambda, body_lambda=nil, &body_block)
      body_lambda ||= body_block.to_proc

      Array.wrap(types).each do |type|
        type= type.to_sym
        finders[type] ||= Set.new
        finders[type] << [name_lambda, body_lambda]
      end
    end

    def self.define_for klass
      klass.columns.each do |column|
        (finders[column.type] || []).each do |name_l, body|
          wrapped= ->(*args) do
            args.insert(0, column);
            klass.instance_exec *args, &body
          end

          klass.define_singleton_method name_l.(column), &wrapped
        end
      end
    end

    def self.finders
      @@finders ||= {}
    end
  end
end

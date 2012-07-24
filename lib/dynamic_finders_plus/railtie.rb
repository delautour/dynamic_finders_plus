require "rails"
require "active_model/railtie"

module DynamicFindersPlus

  def DynamicFindersPlus.define_for klass
    DynamicFindersPlus::Railtie.klasses << klass
  end

  class Railtie < Rails::Railtie
    config.after_initialize do

      def DynamicFindersPlus.define_for klass
        Finder.define_for klass unless klass.abstract_class
      end

      klasses.each do |klass|
        DynamicFindersPlus.define_for klass
      end
    end

    def self.klasses
      @@klasses ||= Set.new
    end
  end
end

module ActiveRecord
  class Base
    class << self
      alias b1862897f5d04bd5be5e76e0ba0812bc inherited
      def inherited klass
        b1862897f5d04bd5be5e76e0ba0812bc klass
        DynamicFindersPlus.define_for klass
      end
    end
  end
end

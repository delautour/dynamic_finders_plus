module DynamicFindersPlus
  class BooleanDefiners < Finder

    finder :boolean, ->(column){"is_#{column.name}"} do |k, column|
      k.where column.name => true
    end

    finder :boolean, ->(column){"is_not_#{column.name}"} do |k, column|
      k.where column.name => false
    end
  end
end

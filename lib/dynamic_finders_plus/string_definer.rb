module DynamicFindersPlus
  class StringDefiners < Finder
    finder :string, ->(column){"#{column.name}_contains"} do |k, column, term|
      k.where(k.arel_table[column.name].matches("%#{term}%"))
    end
  end
end

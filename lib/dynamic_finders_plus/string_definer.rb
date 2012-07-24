module DynamicFindersPlus
  class StringDefiners < Finder
    finder :string, ->(column){"#{column.name}_contains"} do |column, term|
      where(arel_table[column.name].matches("%#{term}%"))
    end
  end
end

require 'active_record'
require 'dynamic_finders_plus'


# Connect to a temporary database and create the appropriate model tables
ActiveRecord::Base.establish_connection(
    :adapter   => 'sqlite3',
    :database  => ':memory:',
    :verbosity => 'quiet'
)
ActiveRecord::Base.connection.execute(%Q{
      CREATE TABLE IF NOT EXISTS simple_models(
        id INTEGER PRIMARY KEY,
        name VARCHAR(255),
        age INTEGER,
        active BOOLEAN,
        date_of_birth DATETIME
      )
    })

class SimpleModel < ActiveRecord::Base
end



RSpec.configure do |config|
  config.before(:all) do

  end

  config.before(:each) do
    SimpleModel.destroy_all
  end
end

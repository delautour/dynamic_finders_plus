require 'spec_helper'

describe SimpleModel do

  subject { SimpleModel }

  context "The first query on the model" do
    around do |e|
      ActiveRecord::Base.connection.execute <<-SQL
        CREATE TABLE users(
          id INTEGER PRIMARY KEY,
          name VARCHAR(255),
          age INTEGER,
          active BOOLEAN,
          date_of_birth DATETIME
        )
        SQL

      e.run

      ActiveRecord::Base.connection.execute "DROP TABLE users"
    end

    class User < ActiveRecord::Base
    end

    subject { User.where(active: true).name_contains("foo") }

    it "should maintain the original scope" do
      active = User.create active: true, name: "foo"
      inactive = User.create active: false, name: "foo"

      should include active
      should_not include inactive
    end
  end

  it { expect { SimpleModel.name }.to_not raise_error(NameError) }
  it { expect { SimpleModel.is_active }.to_not raise_error(NameError) }
  it { expect { SimpleModel.is_not_active }.to_not raise_error(NameError) }

end

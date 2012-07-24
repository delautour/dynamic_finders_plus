require 'spec_helper'

describe SimpleModel do

  subject { SimpleModel }

  it { should respond_to :name_contains }
  it { should respond_to :is_active }
  it { should respond_to :is_not_active }

end

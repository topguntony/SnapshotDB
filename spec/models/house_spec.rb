require 'spec_helper'

describe House do
  it { should have_many(:students) }
end

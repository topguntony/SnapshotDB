require 'spec_helper'

describe Ethnicity do
  it { should have_many(:students) }
end

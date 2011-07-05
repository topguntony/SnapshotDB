require 'spec_helper'

describe Student do
  it { should have_many(:sessions) }
  it { should have_many(:behaviour_logs) }
  it { should belong_to(:ethnicity) }
  it { should belong_to(:house) }
  it { should belong_to(:year_group) }
  
  pending "check #name"
end

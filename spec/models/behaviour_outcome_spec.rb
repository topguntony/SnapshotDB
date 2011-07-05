require 'spec_helper'

describe BehaviourOutcome do
  it { should have_many(:behaviour_logs) }
end

require 'spec_helper'

describe BehaviourReason do
  it { should have_many(:behaviour_logs) }
end

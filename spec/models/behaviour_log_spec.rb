require 'spec_helper'

describe BehaviourLog do
  it { should belong_to(:student) }
  it { should belong_to(:staff) }
  it { should belong_to(:location) }
  it { should belong_to(:subject) }
  it { should belong_to(:behaviour_log_import) }
  
  it { should belong_to(:behaviour_reason) }
  it { should belong_to(:behaviour_outcome) }
end

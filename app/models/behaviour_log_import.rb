class BehaviourLogImport < ActiveRecord::Base
  has_many :behaviour_logs, :dependent => :destroy
end

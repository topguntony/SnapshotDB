class BehaviourLog < ActiveRecord::Base
  belongs_to :student, :counter_cache => true
  belongs_to :staff
  belongs_to :location
  belongs_to :subject
  belongs_to :behaviour_log_import
  belongs_to :behaviour_outcome
  belongs_to :behaviour_reason
  
  named_scope :on_call, :conditions => ["behaviour_outcome_id = ?", 3], :order => "date DESC" 
end

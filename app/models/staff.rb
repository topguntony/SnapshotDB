class Staff < ActiveRecord::Base
  has_many :behaviour_logs
  named_scope :referrer, :conditions => ["referrer = ?", true], :order => "last_name ASC" 

  def name
    "#{salutation} #{first_name} #{last_name}"
  end
end

class Student < ActiveRecord::Base
  belongs_to :ethnicity
  belongs_to :house
  belongs_to :year_group
  has_many :sessions
  has_many :behaviour_logs
  has_many :exclusions
  
  accepts_nested_attributes_for :sessions, 
                                :reject_if => proc { |attrs| attrs['reason_id'].blank? && attrs['referrer_id'].blank? }, 
                                :allow_destroy => true
  
  def name
    "#{first_name} #{last_name}"
  end
end

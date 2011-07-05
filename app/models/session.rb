class Session < ActiveRecord::Base
  belongs_to :reason
  belongs_to :student, :counter_cache => true
  belongs_to :subject
  
  # Only allow period to occur once per student per day
  validates_uniqueness_of :period, :scope => [:student_id, :date]
  validates_presence_of :reason_id
  validates_presence_of :referrer_id
  
  
  #validates_format_of :period, :with => %w(Reg 1 2 3 4 5)
  
  def self.total_on_week_starting(date)
    where(:date => date..date+6.days).count
  end
  
  def self.total_by_reason_id(reason_id)
    where(:reason_id => reason_id).count
  end
    
  def self.total_by_gender(gender)
    joins(:student).where(:students => {:gender => gender}).count
  end
end
